import { readFileSync } from 'node:fs';

const detectorModule = process.env.VIDEO_SLIDE_EXTRACTOR_MODULE
  ?? '../../../../video-slide-extractor/index.js';
const { extractSlideIndices } = await import(detectorModule);

const [rawPath, widthArg = '160', heightArg = '90', intervalArg = '2'] = process.argv.slice(2);

if (!rawPath) {
  console.error('Usage: node scripts/run-video-slide-extractor.mjs <rgba-file> [width] [height] [sample-seconds]');
  process.exit(1);
}

const width = Number(widthArg);
const height = Number(heightArg);
const sampleSeconds = Number(intervalArg);
const frameBytes = width * height * 4;
const raw = readFileSync(rawPath);

if (!Number.isFinite(width) || !Number.isFinite(height) || !Number.isFinite(sampleSeconds)
    || width <= 0 || height <= 0 || sampleSeconds <= 0 || raw.length % frameBytes !== 0) {
  throw new Error(`Invalid dimensions, interval, or RGBA byte length: ${raw.length}`);
}

const frames = [];
for (let offset = 0; offset < raw.length; offset += frameBytes) {
  frames.push(raw.subarray(offset, offset + frameBytes));
}

const kept = extractSlideIndices(frames, width, height);

console.log('sample_index,timestamp_seconds');
for (const index of kept) {
  console.log(`${index},${(index * sampleSeconds).toFixed(3)}`);
}
console.error(JSON.stringify({
  width,
  height,
  sampleSeconds,
  sampledFrames: frames.length,
  keptFrames: kept.length,
}));
