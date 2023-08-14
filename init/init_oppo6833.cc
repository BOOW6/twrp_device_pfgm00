#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

void property_override(char const prop[], char const value[]);

void vendor_load_properties() {
  // for OTAs
  // from device's build.prop: ro.build.product is obsolete; use ro.product.device
  // but it still use "ro.build.product=oplus_mssi_64_cn"
  property_override("ro.build.product", "oplus_mssi_64_cn");
  property_override("ro.product.device", "oplus_mssi_64_cn");

  std::string prjname = GetProperty("ro.boot.prjname", "");

  LOG(DEBUG) << "This device is Oppo A93s 5g" << std::endl;

  property_override("ro.product.name", "oppo6833");
  property_override("ro.product.model", "oppo6833");
  // could not find this line
  //property_override("ro.separate.soft", "206FF");
}

void property_override(char const prop[], char const value[]) {
  prop_info *pi;

  pi = (prop_info *)__system_property_find(prop);
  if (pi)
    __system_property_update(pi, value, strlen(value));
  else
    __system_property_add(prop, strlen(prop), value, strlen(value));
}
