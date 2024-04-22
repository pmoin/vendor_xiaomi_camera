# MIUI/Leica Camera

## proprietary_vendor_xiaomi_camera

Prebuilt stock MIUI/Leica Camera for Poco F3/Redmi K40/Mi 11x (alioth), to include in custom ROM builds.

### How to use?

1. Clone this repo to `vendor/xiaomi/camera`

2. Inherit it from `device.mk` in device tree:

```
# Camera
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)
```

3. Ensure that you added misys vintf dependencies in your framework_compatibility_matrix.xml:

```
    <hal format="hidl" optional="true">
        <name>vendor.xiaomi.hardware.misys</name>
        <version>1.0</version>
        <version>2.0</version>
        <version>3.0</version>
        <version>4.0</version>
        <interface>
            <name>IMiSys</name>
            <instance>default</instance>
        </interface>
    </hal>
```
3.1 Reference - https://github.com/VoidUI-Devices/device_xiaomi_sm8250-common/commit/c8ae872b8fdbc682da0f98a2031125d68ef0afe9
3.2 Reference - https://gitlab.com/johnmart19/vendor_xiaomi_camera

- Thanks a to johnmart19 (Ivan) who made things possible on alioth/aliothin device.
