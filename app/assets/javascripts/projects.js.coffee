$ ->
  if $('body').hasClass('projects')
    $.ajax
      url: "https://api.github.com/users/peterklipfel/repos"
      dataType: "jsonp"
      success: (obj) ->
        console.log obj.data
        for repo in obj.data
          $('.dump-github').append(
            '<div class="github-repo">'+ 
              '<span class="github-repo-name">' + repo.name + '</span>' +
              '</br>' +
              '<a class="github-repo-url" href="' + repo.html_url + '">View on Github</a>' +
            "</div>")
