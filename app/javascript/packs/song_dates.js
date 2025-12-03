// TO DO: CLEAN THIS FILE UP

document.addEventListener('turbolinks:load', () => {
  console.log('Turbolinks loaded');

  const songSelect = document.getElementById('song_version_song_name');
  const dateSelect = document.getElementById('song_version_date');

  console.log('Song select:', songSelect);
  console.log('Date select:', dateSelect);

  if (!songSelect || !dateSelect) {
    console.error('Elements not found!');
    return;
  }

  songSelect.addEventListener('change', async (event) => {
    console.log('Song changed!', event.target.value);
    const selectedOption = event.target.options[event.target.selectedIndex];
    const slug = selectedOption.dataset.slug;

    if (!slug) {
      dateSelect.innerHTML = '<option value="">First select a song</option>';
      dateSelect.disabled = true;
      return;
    }

    dateSelect.innerHTML = '<option value="">Loading dates...</option>';
    dateSelect.disabled = true;

    try {
      const url = `/song_versions/dates_for_song?slug=${encodeURIComponent(slug)}`;
      console.log('Fetching:', url);

      const response = await fetch(url);
      console.log('Response:', response);

      if (!response.ok) {
        throw new Error('Failed to fetch dates');
      }

      const data = await response.json();
      console.log('Data received:', data);

      dateSelect.innerHTML = '<option value="">Select a date</option>';
      if (data.length > 0) {
        data.forEach(([dateInfo]) => {
          const option = document.createElement('option');
          option.value = dateInfo;
          option.textContent = dateInfo;
          dateSelect.appendChild(option);
        });
        dateSelect.disabled = false;
      } else {
        dateSelect.innerHTML = '<option value="">No dates available</option>';
        dateSelect.disabled = true;
      }
    } catch (error) {
      console.error('Error fetching dates:', error);
      dateSelect.innerHTML = '<option value="">Error loading dates</option>';
      dateSelect.disabled = true;
    }
  });
});
