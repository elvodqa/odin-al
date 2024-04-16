package al

when ODIN_OS == .Windows {
    foreign import al "openal32.lib"
}
when ODIN_OS == .Darwin {
    foreign import al "system:OpenAL.framework"
}
when ODIN_OS == .Linux {
    foreign import al "system:libopenal.so"
}

import a ".."

INVALID :a.ALenum: -1;
NONE :a.ALenum: 0;
FALSE :a.ALenum: 0;
TRUE :a.ALenum: 1;
SOURCE_RELATIVE :a.ALenum: 0x202;
CONE_INNER_ANGLE :a.ALenum: 0x1001;
CONE_OUTER_ANGLE :a.ALenum: 0x1002;
PITCH :a.ALenum: 0x1003;
POSITION :a.ALenum: 0x1004;
DIRECTION :a.ALenum: 0x1005;
VELOCITY :a.ALenum: 0x1006;
LOOPING :a.ALenum: 0x1007;
BUFFER :a.ALenum: 0x1009;
GAIN :a.ALenum: 0x100A;
MIN_GAIN :a.ALenum: 0x100D;
MAX_GAIN :a.ALenum: 0x100E;
ORIENTATION :a.ALenum: 0x100F;
CHANNEL_MASK :a.ALenum: 0x3000;
SOURCE_STATE :a.ALenum: 0x1010;
INITIAL :a.ALenum: 0x1011;
PLAYING :a.ALenum: 0x1012;
PAUSED :a.ALenum: 0x1013;
STOPPED :a.ALenum: 0x1014;
BUFFERS_QUEUED :a.ALenum: 0x1015;
BUFFERS_PROCESSED :a.ALenum: 0x1016;
SEC_OFFSET :a.ALenum: 0x1024;
SAMPLE_OFFSET :a.ALenum: 0x1025;
BYTE_OFFSET :a.ALenum: 0x1026;
SOURCE_TYPE :a.ALenum: 0x1027;
STATIC :a.ALenum: 0x1028;
STREAMING :a.ALenum: 0x1029;
UNDETERMINED :a.ALenum: 0x1030;
FORMAT_MONO8 :a.ALenum: 0x1100;
FORMAT_MONO16 :a.ALenum: 0x1101;
FORMAT_STEREO8 :a.ALenum: 0x1102;
FORMAT_STEREO16 :a.ALenum: 0x1103;
REFERENCE_DISTANCE :a.ALenum: 0x1020;
ROLLOFF_FACTOR :a.ALenum: 0x1021;
CONE_OUTER_GAIN :a.ALenum: 0x1022;
MAX_DISTANCE :a.ALenum: 0x1023;
FREQUENCY :a.ALenum: 0x2001;
BITS :a.ALenum: 0x2002;
CHANNELS :a.ALenum: 0x2003;
SIZE :a.ALenum: 0x2004;
UNUSED :a.ALenum: 0x2010;
PENDING :a.ALenum: 0x2011;
PROCESSED :a.ALenum: 0x2012;
NO_ERROR :a.ALenum: FALSE;
INVALID_NAME :a.ALenum: 0xA001;
ILLEGAL_ENUM :a.ALenum: 0xA002;
INVALID_ENUM :a.ALenum: 0xA002;
INVALID_VALUE :a.ALenum: 0xA003;
ILLEGAL_COMMAND :a.ALenum: 0xA004;
INVALID_OPERATION :a.ALenum: 0xA004;
OUT_OF_MEMORY :a.ALenum: 0xA005;
VENDOR :a.ALenum: 0xB001;
VERSION :a.ALenum: 0xB002;
RENDERER :a.ALenum: 0xB003;
EXTENSIONS :a.ALenum: 0xB004;
DOPPLER_FACTOR :a.ALenum: 0xC000;
DOPPLER_VELOCITY :a.ALenum: 0xC001;
SPEED_OF_SOUND :a.ALenum: 0xC003;
DISTANCE_MODEL :a.ALenum: 0xD000;
INVERSE_DISTANCE :a.ALenum: 0xD001;
INVERSE_DISTANCE_CLAMPED :a.ALenum: 0xD002;
LINEAR_DISTANCE :a.ALenum: 0xD003;
LINEAR_DISTANCE_CLAMPED :a.ALenum: 0xD004;
EXPONENT_DISTANCE :a.ALenum: 0xD005;
EXPONENT_DISTANCE_CLAMPED :a.ALenum: 0xD006;



@(link_prefix="al", default_calling_convention="c") 
foreign al {
    @(link_name="alEnable") enable :: proc(capability: a.ALenum) ---   
    @(link_name="alDisable") disable :: proc(capability: a.ALenum) ---
    @(link_name="alIsEnabled") is_enabled :: proc(capability: a.ALenum) -> a.ALboolean ---
    @(link_name="alGetString") get_string :: proc(param: a.ALenum) -> cstring ---
    @(link_name="alGetBooleanv") get_booleanv :: proc(param: a.ALenum, data: ^a.ALboolean) ---    
    @(link_name="alGetIntegerv") get_integerv :: proc(param: a.ALenum, data: ^a.ALint) ---
    @(link_name="alGetFloatv") get_floatv :: proc(param: a.ALenum, data: ^a.ALfloat) ---
    @(link_name="alGetDoublev") get_doublev :: proc(param: a.ALenum, data: ^a.ALdouble) ---
    @(link_name="alGetBoolean") get_boolean :: proc(param: a.ALenum) -> a.ALboolean ---
    @(link_name="alGetInteger") get_integer :: proc(param: a.ALenum) -> a.ALint ---
    @(link_name="alGetFloat") get_float :: proc(param: a.ALenum) -> a.ALfloat ---
    @(link_name="alGetDouble") get_double :: proc(param: a.ALenum) -> a.ALdouble ---
    @(link_name="alGetError") get_error :: proc() -> a.ALenum ---
    @(link_name="alIsExtensionPresent") is_extension_present :: proc(extname: cstring) -> a.ALboolean ---
    @(link_name="alGetProcAddress") get_proc_address :: proc(fname: cstring) -> proc() ---
    @(link_name="alGetEnumValue") get_enum_value :: proc(ename: cstring) -> a.ALenum ---
    @(link_name="alListenerf") listenerf :: proc(param: a.ALenum, value: a.ALfloat) ---
    @(link_name="alListener3f") listener3f :: proc(param: a.ALenum, value1: a.ALfloat, value2: a.ALfloat, value3: a.ALfloat) ---
    @(link_name="alListenerfv") listenerfv :: proc(param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alGetListenerf") get_listenerf :: proc(param: a.ALenum, value: ^a.ALfloat) ---
    @(link_name="alGetListener3f") get_listener3f :: proc(param: a.ALenum, value1: ^a.ALfloat, value2: ^a.ALfloat, value3: ^a.ALfloat) ---
    @(link_name="alGetListenerfv") get_listenerfv :: proc(param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alGenSources") gen_sources :: proc(n: a.ALsizei, sources: ^a.ALuint) ---
    @(link_name="alDeleteSources") delete_sources :: proc(n: a.ALsizei, sources: ^a.ALuint) ---
    @(link_name="alIsSource") is_source :: proc(sid: a.ALuint) -> a.ALboolean ---
    @(link_name="alSourcef") sourcef :: proc(sid: a.ALuint, param: a.ALenum, value: a.ALfloat) ---
    @(link_name="alSource3f") source3f :: proc(sid: a.ALuint, param: a.ALenum, value1: a.ALfloat, value2: a.ALfloat, value3: a.ALfloat) ---
    @(link_name="alSourcefv") sourcefv :: proc(sid: a.ALuint, param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alSourcei") sourcei :: proc(sid: a.ALuint, param: a.ALenum, value: a.ALint) ---
    @(link_name="alSource3i") source3i :: proc(sid: a.ALuint, param: a.ALenum, value1: a.ALint, value2: a.ALint, value3: a.ALint) ---
    @(link_name="alSourceiv") sourceiv :: proc(sid: a.ALuint, param: a.ALenum, values: ^a.ALint) ---
    @(link_name="alGetSourcef") get_sourcef :: proc(sid: a.ALuint, param: a.ALenum, value: ^a.ALfloat) ---
    @(link_name="alGetSource3f") get_source3f :: proc(sid: a.ALuint, param: a.ALenum, value1: ^a.ALfloat, value2: ^a.ALfloat, value3: ^a.ALfloat) ---
    @(link_name="alGetSourcefv") get_sourcefv :: proc(sid: a.ALuint, param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alGetSourcei") get_sourcei :: proc(sid: a.ALuint, param: a.ALenum, value: ^a.ALint) ---
    @(link_name="alGetSource3i") get_source3i :: proc(sid: a.ALuint, param: a.ALenum, value1: ^a.ALint, value2: ^a.ALint, value3: ^a.ALint) ---
    @(link_name="alGetSourceiv") get_sourceiv :: proc(sid: a.ALuint, param: a.ALenum, values: ^a.ALint) ---
    @(link_name="alSourcePlayv") source_playv :: proc(n: a.ALsizei, sids: ^a.ALuint) ---
    @(link_name="alSourceStopv") source_stopv :: proc(n: a.ALsizei, sids: ^a.ALuint) ---
    @(link_name="alSourceRewindv") source_rewindv :: proc(n: a.ALsizei, sids: ^a.ALuint) ---
    @(link_name="alSourcePausev") source_pausev :: proc(n: a.ALsizei, sids: ^a.ALuint) ---
    @(link_name="alSourcePlay") source_play :: proc(sid: a.ALuint) ---
    @(link_name="alSourceStop") source_stop :: proc(sid: a.ALuint) ---
    @(link_name="alSourceRewind") source_rewind :: proc(sid: a.ALuint) ---
    @(link_name="alSourcePause") source_pause :: proc(sid: a.ALuint) ---
    @(link_name="alSourceQueueBuffers") source_queue_buffers :: proc(sid: a.ALuint, num_entries: a.ALsizei, bids: ^a.ALuint) ---
    @(link_name="alSourceUnqueueBuffers") source_unqueue_buffers :: proc(sid: a.ALuint, num_entries: a.ALsizei, bids: ^a.ALuint) ---
    @(link_name="alGenBuffers") gen_buffers :: proc(n: a.ALsizei, buffers: ^a.ALuint) ---
    @(link_name="alDeleteBuffers") delete_buffers :: proc(n: a.ALsizei, buffers: ^a.ALuint) ---
    @(link_name="alIsBuffer") is_buffer :: proc(bid: a.ALuint) -> a.ALboolean ---
    @(link_name="alBufferData") buffer_data :: proc(bid: a.ALuint, format: a.ALenum, data: rawptr, size: a.ALsizei, freq: a.ALsizei) ---
    @(link_name="alBufferf") bufferf :: proc(bid: a.ALuint, param: a.ALenum, value: a.ALfloat) ---
    @(link_name="alBuffer3f") buffer3f :: proc(bid: a.ALuint, param: a.ALenum, value1: a.ALfloat, value2: a.ALfloat, value3: a.ALfloat) ---
    @(link_name="alBufferfv") bufferfv :: proc(bid: a.ALuint, param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alBufferi") bufferi :: proc(bid: a.ALuint, param: a.ALenum, value: a.ALint) ---
    @(link_name="alBuffer3i") buffer3i :: proc(bid: a.ALuint, param: a.ALenum, value1: a.ALint, value2: a.ALint, value3: a.ALint) ---
    @(link_name="alBufferiv") bufferiv :: proc(bid: a.ALuint, param: a.ALenum, values: ^a.ALint) ---
    @(link_name="alGetBufferf") get_bufferf :: proc(bid: a.ALuint, param: a.ALenum, value: ^a.ALfloat) ---
    @(link_name="alGetBuffer3f") get_buffer3f :: proc(bid: a.ALuint, param: a.ALenum, value1: ^a.ALfloat, value2: ^a.ALfloat, value3: ^a.ALfloat) ---
    @(link_name="alGetBufferfv") get_bufferfv :: proc(bid: a.ALuint, param: a.ALenum, values: ^a.ALfloat) ---
    @(link_name="alGetBufferi") get_bufferi :: proc(bid: a.ALuint, param: a.ALenum, value: ^a.ALint) ---
    @(link_name="alGetBuffer3i") get_buffer3i :: proc(bid: a.ALuint, param: a.ALenum, value1: ^a.ALint, value2: ^a.ALint, value3: ^a.ALint) ---
    @(link_name="alGetBufferiv") get_bufferiv :: proc(bid: a.ALuint, param: a.ALenum, values: ^a.ALint) ---
    @(link_name="alDopplerFactor") doppler_factor :: proc(value: a.ALfloat) ---
    @(link_name="alDopplerVelocity") doppler_velocity :: proc(value: a.ALfloat) ---
    @(link_name="alSpeedOfSound") speed_of_sound :: proc(value: a.ALfloat) ---
    @(link_name="alDistanceModel") distance_model :: proc(value: a.ALenum) ---
}