import type { MainModule } from "../build/libopus";

const OPUS_OK = 0;
const OPUS_BAD_ARG = -1;
const OPUS_BUFFER_TOO_SMALL = -2;
const OPUS_INTERNAL_ERROR = -3;
const OPUS_INVALID_PACKET = -4;
const OPUS_UNIMPLEMENTED = -5;
const OPUS_INVALID_STATE = -6;
const OPUS_ALLOC_FAIL = -7;

export class OpusError extends Error {
    static getMessageFromCode(errorCode: number): string {
        switch (errorCode) {
            case OPUS_OK:
                return "Ok";
            case OPUS_BAD_ARG:
                return "Bad Argument";
            case OPUS_BUFFER_TOO_SMALL:
                return "Buffer Too Small";
            case OPUS_INTERNAL_ERROR:
                return "Internal Error";
            case OPUS_INVALID_PACKET:
                return "Invalid Packet";
            case OPUS_UNIMPLEMENTED:
                return "Unimplemented Feature";
            case OPUS_INVALID_STATE:
                return "Invalid State";
            case OPUS_ALLOC_FAIL:
                return "Memory Allocation Failed";
            default:
                return `Unknown Opus error code: ${errorCode}`;
        }
    }

    constructor(errorCode: number) {
        super(OpusError.getMessageFromCode(errorCode));
        this.name = "OpusError";
    }
}

// https://www.opus-codec.org/docs/opus_api-1.1.2/group__opus__multistream.html
export class OpusMultistreamDecoder {
    private module: MainModule
    private ptr: number | null = null

    constructor(module: MainModule, sampleRate: number, channels: number, streams: number, coupled_channels: number, mapping: number) {
        this.module = module

        this.ptr = module._opus_multistream_decoder_create(sampleRate, channels, coupled_channels, streams, mapping, error)
    }

    init() {
        this.module._opus_multistream_decoder_init
    }
}