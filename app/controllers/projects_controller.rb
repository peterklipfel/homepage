class ProjectsController < ApplicationController
  def index
    @projects=[
      {
        title: 'Song Picker',
        description: 'Allows people to anonymously upload and consume songs.  Songs are categorized by attributes',
        language: 'Javascript',
        link: "http://radio.peterklipfel.com"
      },
      { title: 'Visualizer', 
        description: 'Pulls latest soundcloud songs.  Use arrows & pg up/pg down',
        language: 'WebGL',
        link: project_path('visualizer')
      },
      { title: 'Webcam Filters', 
        description: 'Applies filters to webcam.  Use arrows',
        language: 'WebGL',
        link: project_path('webcam')
      },
      { title: 'Particle Engine', 
        description: 'Makes spiral-like pattern with star gifs.  Use arrows & pg up/pg down',
        language: 'WebGL',
        link: project_path('stars')
      },
      { title: 'Procedurally Textured Box Cluster', 
        description: 'Uses procedural texturing on a bunch of boxes.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        language: 'WebGL',
        link: project_path('boxes')
      },
      { title: 'Procedurally Textured Box', 
        description: 'Uses procedural texturing on a single box.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        language: 'WebGL',
        link: project_path('procedural')
      },
      { title: 'Positional Shading', 
        description: 'Colors box based on position on screen.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        language: 'WebGL',
        link: project_path('box')
      },
      { title: 'Hello World', 
        description: 'Just a box and a pyramid.  Use arrows & pg up/pg down',
        language: 'WebGL',
        link: project_path('basic')
      }
    ]
  end
	def show
		render params[:id], layout: false
	end
end
