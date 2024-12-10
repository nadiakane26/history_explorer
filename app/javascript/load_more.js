$(document).ready(function () {
  // Load more comments 
  $('#load-more-comments').click(function(e) {
    e.preventDefault();  // Prevent page refresh

    // Get request for the URL link that points to the next page
    $.get($(this).attr('href'), function(data) {
      
        // console.log(data)
        // Finds the new comments in html format of the data  
      $('#comments').append($(data).find('#comments').html());  // Append new comments
      $('#load-more-container').replaceWith($(data).find('#load-more-container'));  // Update the "Load More" button
    })
    .fail(function () {
      $('#comments').append('<p class="error-message">Failed to load comments. Please try again later.</p>');
    });
  });
});