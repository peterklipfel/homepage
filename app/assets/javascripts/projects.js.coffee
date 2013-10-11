$ ->
  if $('body').hasClass('projects')
    $.ajax
      url: "https://api.github.com/users/peterklipfel/repos"
      dataType: "jsonp"
      success: (obj) ->
        console.log obj.data
        for repo in obj.data
          date = new Date(repo.updated_at)
          $('.dump-github').append(
            '<div class="project-container">' +
              '<div class="six columns centered">' +
                '<h4 class="project-language">' + repo.language + '</h4>' +
                '<h3 class="project-name">' + repo.name + '</h3>' +
                '</br>' +
                '<span class="project-description">'+repo.description+'</span> </br>' +
                '<span class="project-date">'+date.toDateString()+'</span>' +
                '<a class="project-link" href="' + repo.html_url + '">View on Github</a>' +
              '</div>'+
            "</div>")
