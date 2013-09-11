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
              '<h3 class="github-repo-name">' + repo.name + '</h3>' +
              '</br>' +
              '<a class="github-repo-url" href="' + repo.html_url + '">View on Github</a>' +
              '<span>'+repo.description+'</span>' +
              '<span>'+date.toDateString()+'</span>' +
            "</div>")
