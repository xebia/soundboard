const samples = {
  rhythm: new RhythmSample(),
  funk: new SingleSound('funk.wav'),
  macquillage: new SingleSound('il-macquillage-lady.wav')
};

// Play sample with id when button is clicked
document.querySelectorAll('.button[id]').forEach(function (el) {
  const sample = samples[el.id];
  if (sample) {
    el.addEventListener('click', () => sample.play());
  } else {
    console.warn('Sample "' + el.id + '" is not loaded');
  }
});
