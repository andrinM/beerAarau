// script.js - Simplified for one 'beers' table

document.addEventListener('DOMContentLoaded', () => {
    // The URL now points to our new, simple API endpoint
    const apiUrl = 'http://localhost:3000/api/beers';

    // The container in index.html where we will put our list
    const beersContainer = document.getElementById('bars-container'); // The ID is still ok

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(beers => {
            // 'beers' is now a simple array of beer objects: [{id, name, brewery}, ...]
            console.log('Data received from API:', beers);

            if (beers.length === 0) {
                beersContainer.innerHTML = '<p>No beers found in the database yet!</p>';
                return;
            }

            // Create the HTML for a Bootstrap list group
            let beersHtml = '<ul class="list-group">';

            // Loop through each beer and create a list item for it
            beers.forEach(beer => {
                beersHtml += `
                    <li class="list-group-item">
                        <strong>${beer.name}</strong>
                        <br>
                        <small class="text-muted">${beer.brewery}</small>
                    </li>
                `;
            });

            beersHtml += '</ul>';

            // Replace the content of the container with our new list
            beersContainer.innerHTML = beersHtml;
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            beersContainer.innerHTML = '<p class="text-danger">Could not load data. Is the backend server running?</p>';
        });
});