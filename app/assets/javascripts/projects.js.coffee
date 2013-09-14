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
            '<div class="github-repo">' +
              '<div class="six columns centered">' +
                '<h4 class="github-repo-language">' + repo.language + '</h4>' +
                '<h3 class="github-repo-name">' + repo.name + '</h3>' +
                '</br>' +
                '<span class="repo-description">'+repo.description+'</span> </br>' +
                '<span class="repo-date">'+date.toDateString()+'</span>' +
                '<a class="github-repo-url" href="' + repo.html_url + '">View on Github</a>' +
              '</div>'+
            "</div>")
