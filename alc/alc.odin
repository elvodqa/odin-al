package alc

when ODIN_OS == .Windows {
    foreign import alc "openal32.lib"
}
when ODIN_OS == .Darwin {
    foreign import alc "system:OpenAL.framework"
}
when ODIN_OS == .Linux {
    foreign import al "system:libopenal.so"
}

import al ".."

FALSE                            :al.ALenum: 0
TRUE                             :al.ALenum: 1
FREQUENCY                        :al.ALenum: 0x1007
REFRESH                          :al.ALenum: 0x1008
SYNC                             :al.ALenum: 0x1009
MONO_SOURCES                     :al.ALenum: 0x1010
STEREO_SOURCES                   :al.ALenum: 0x1011
NO_ERROR                         :al.ALenum: FALSE
INVALID_DEVICE                   :al.ALenum: 0xA001
INVALID_CONTEXT                  :al.ALenum: 0xA002
INVALID_ENUM                     :al.ALenum: 0xA003
INVALID_VALUE                    :al.ALenum: 0xA004
OUT_OF_MEMORY                    :al.ALenum: 0xA005
DEFAULT_DEVICE_SPECIFIER         :al.ALenum: 0x1004
DEVICE_SPECIFIER                 :al.ALenum: 0x1005
EXTENSIONS                       :al.ALenum: 0x1006
MAJOR_VERSION                    :al.ALenum: 0x1000
MINOR_VERSION                    :al.ALenum: 0x1001
ATTRIBUTES_SIZE                  :al.ALenum: 0x1002
ALL_ATTRIBUTES                   :al.ALenum: 0x1003
DEFAULT_ALL_DEVICES_SPECIFIER    :al.ALenum: 0x1012
ALL_DEVICES_SPECIFIER            :al.ALenum: 0x1013
CAPTURE_DEVICE_SPECIFIER         :al.ALenum: 0x310
CAPTURE_DEFAULT_DEVICE_SPECIFIER :al.ALenum: 0x311
CAPTURE_SAMPLES                  :al.ALenum: 0x312

Device  :: distinct rawptr;
Context :: distinct rawptr;


@(default_calling_convention="c") 
foreign alc {
	@(link_name="alcCreateContext") create_context :: proc(device: Device, attrlist: ^al.ALint) -> Context ---
	@(link_name="alcMakeContextCurrent") make_context_current :: proc(ctx: Context) -> al.ALenum ---
	@(link_name="alcProcessContext") process_context :: proc(ctx: Context) ---
	@(link_name="alcSuspendContext") suspend_context :: proc(ctx: Context) ---
	@(link_name="alcDestroyContext") destroy_context :: proc(ctx: Context) ---
	@(link_name="alcGetCurrentContext") get_current_context :: proc() -> Context ---
	@(link_name="alcGetContextsDevice") get_contexts_device :: proc(ctx: Context) -> Device ---
	@(link_name="alcOpenDevice") open_device :: proc(devicename: ^u8) -> Device ---
	@(link_name="alcCloseDevice") close_device :: proc(device: Device) ---
	@(link_name="alcGetError") get_error :: proc(device: Device) -> al.ALenum ---
	@(link_name="alcIsExtensionPresent") is_extension_present :: proc(device: Device, extname: ^u8) -> al.ALboolean ---
	@(link_name="alcGetProcAddress") get_proc_address :: proc(device: Device, funcname: ^u8) -> ^u8 ---
	@(link_name="alcGetEnumValue") get_enum_value :: proc(device: Device, enumname: ^u8) -> al.ALenum ---
	@(link_name="alcGetString") get_string :: proc(device: Device, param: al.ALenum) -> ^u8 ---
	@(link_name="alcGetIntegerv") get_integerv :: proc(device: Device, param: al.ALenum, size: al.ALsizei, data: ^al.ALint) ---
	@(link_name="alcCaptureOpenDevice") capture_open_device :: proc(devicename: ^u8, frequency: al.ALuint, format: al.ALenum, buffersize: al.ALsizei) -> Device ---
	@(link_name="alcCaptureCloseDevice") capture_close_device :: proc(device: Device) ---
	@(link_name="alcCaptureStart") capture_start :: proc(device: Device) ---
	@(link_name="alcCaptureStop") capture_stop :: proc(device: Device) ---
	@(link_name="alcCaptureSamples") capture_samples :: proc(device: Device, buffer: ^u8, samples: al.ALsizei) ---
}
