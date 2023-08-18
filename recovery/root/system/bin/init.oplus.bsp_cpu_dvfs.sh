#!/system/bin/sh
#=============================================================================
#persist.debug.cpu.dvfs.config
#testing_phase=`getprop persist.debug.cpu.dvfs.config`
#=============================================================================

echo "Just for CPU DVFS Debug"

#ddr 4case, 60s/1case; total 4*60s
#cpu 6case, 1200s/1case; total 120min
#ntest*delay 20 mini = 1200s
ntest=4000
delay=0.3	## 300ms

LL_rcpu=6
L_rcpu=2

LL_ropp=0
L_ropp=0


#cpu dvfs ramdom
do_cpudvfs_ramdom(){
	echo "cpu dvfs ramdom"
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		LL_ropp=$(($RANDOM%16))
		L_ropp=$(($RANDOM%16))
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		sleep ${delay}
	done
}

#cpu dvfs fixOPP0
do_cpudvfs_fixOPPmax(){
	echo "cpu dvfs fixOPPmax"
	LL_ropp=0
	L_ropp=0
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		sleep ${delay}
	done
}


#cpu dvfs fixOPP15
do_cpudvfs_fixOPPmin(){
	echo "cpu dvfs fixOPPmin"
	LL_ropp=15
	L_ropp=15
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		sleep ${delay}
	done
}


#cpu dvfs OPP0-OPP15
do_cpudvfs_OPPmax_OPPmin(){
	echo "cpu dvfs OPPmax to OPPmin"
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		echo "loop ${i}:"
		check=$(($RANDOM%2))
		if [ $check -eq 0 ]; then
			LL_ropp=0
			L_ropp=0
		else
			LL_ropp=15
			L_ropp=15
		fi
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		sleep ${delay}
	done
}


do_cpudvfs_longstep_random(){
	echo "cpu dvfs longstep_random"
	LL_ropp=$(($RANDOM%16))
	L_ropp=$(($RANDOM%16))
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		LL_step=$(($RANDOM%5))
		L_step=$(($RANDOM%5))
		LL_ropp=$(($LL_ropp+5+$LL_step))
		L_ropp=$(($L_ropp+5+$L_step))
		LL_ropp=$(($LL_ropp%16))
		L_ropp=$(($L_ropp%16))
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		sleep ${delay}
	done
}

do_cpudvfs_shortstep_random(){
	echo "cpu dvfs short step random"
	LL_ropp=$(($RANDOM%16))
	L_ropp=$(($RANDOM%16))
	for i in $(seq 1 ${ntest})
	do
		do_cpuhotplug
		LL_step=$(($RANDOM%3))
		L_step=$(($RANDOM%3))
		LL_ropp=$(($LL_ropp+1+$LL_step))
		L_ropp=$(($L_ropp+1+$L_step))
		LL_ropp=$(($LL_ropp%16))
		L_ropp=$(($L_ropp%16))
		echo "cpu opp=${LL_ropp} ${L_ropp}"
		echo ${LL_ropp} ${L_ropp} > /proc/ppm/policy/ut_fix_freq_idx
		sleep ${delay}
	done
}


#cpu Hotplug ittle cpu core >=2, big core >=0
do_cpuhotplug(){
	# little cpu core >=2, big core >=0
	LL_rcpu=$(($RANDOM%5))
	LL_rcpu=$(($LL_rcpu+2))
	L_rcpu=$(($RANDOM%3))
	echo ${LL_rcpu} ${L_rcpu} > /proc/ppm/policy/ut_fix_core_num
	echo "cpu=${LL_rcpu}, ${L_rcpu}"
}

enable_cpu_hotplug_dvfs_test(){
	while [ 1 ]
	do
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config max
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "max" ]; then
			do_cpudvfs_fixOPPmax
		fi

		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config min
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "min" ]; then
			do_cpudvfs_fixOPPmin
		fi

		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config max_min
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "max_min" ]; then
			do_cpudvfs_OPPmax_OPPmin
		fi

		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config longstep_random
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "longstep_random" ]; then
			do_cpudvfs_longstep_random
		fi

		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config shortstep_random
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "shortstep_random" ]; then
			do_cpudvfs_shortstep_random
		fi

		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		if [ "$cpu_debugconfig" = "done" ]; then
			break
		fi
		setprop persist.debug.cpu.dvfs.config ramdom
		cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
		echo "cpu_debugconfig:$cpu_debugconfig."
		if [ "$cpu_debugconfig" = "random" ]; then
			do_cpudvfs_ramdom
		fi
	done
	echo "The test is done and PASS if no exception occurred."
}

enable_cpu_hotplug_dvfs_test_manual(){
	cpu_debugconfig=`getprop persist.debug.cpu.dvfs.config`
	while [ 1 ] 
	do
		if [ "$cpu_debugconfig" != "done" ]; then
			break
		fi
		cpu_manualconfig=`getprop persist.debug.cpu.dvfs.manual`
		echo "cpu_manualconfig:$cpu_manualconfig."
		if [ "$cpu_manualconfig" = "random" ]; then
			do_cpudvfs_ramdom
		elif [ "$cpu_manualconfig" = "max" ]; then
			do_cpudvfs_fixOPPmax
		elif [ "$cpu_manualconfig" = "min" ]; then
			do_cpudvfs_fixOPPmin
		elif [ "$cpu_manualconfig" = "max_min" ]; then
			do_cpudvfs_OPPmax_OPPmin
		elif [ "$cpu_manualconfig" = "longstep_random" ]; then
			do_cpudvfs_longstep_random
		elif [ "$cpu_manualconfig" = "shortstep_random" ]; then
			do_cpudvfs_shortstep_random
		elif [ "$cpu_manualconfig" = "done" ]; then
			break
		else
			sleep 10
		fi
	done
	echo "The cpu_manualconfig is done and PASS if no exception occurred."
}

enable_cpu_hotplug_dvfs_test
enable_cpu_hotplug_dvfs_test_manual
