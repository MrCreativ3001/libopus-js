
# libopus-js

A library that wraps the [libopus multistream decoder](https://www.opus-codec.org/docs/opus_api-1.1.2/group__opus__multistream.html) so that it can potentially be used with the Web Audio Api for audio playback.

## Usage

1. Compile libopus with the Docker image or docker-compose file.
```
docker compose up
```

2. Build the output js files, they will be placed in `dist`
```
npm run build
```

## Example
For an example of the usage of this library take a look at these files:
- [decode and deinterlace the audio](https://github.com/MrCreativ3001/moonlight-web-stream/blob/26a26509a00221087cc2bdfc0b30bc97f36f1b1c/moonlight-web/web-server/web/stream/audio/audio_decoder_pcm_pipe.ts#L55-L117)
- [play the pcm f32le channels using the web audio api](https://github.com/MrCreativ3001/moonlight-web-stream/blob/26a26509a00221087cc2bdfc0b30bc97f36f1b1c/moonlight-web/web-server/web/stream/audio/audio_buffer_pipe.ts#L59-L113)