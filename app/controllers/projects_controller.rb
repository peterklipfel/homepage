class ProjectsController < ApplicationController
  def index
    @projects=[
      { title: 'Visualizer', 
        description: 'Pulls latest soundcloud songs.  Use arrows & pg up/pg down',
        id: 'visualizer'
      },
      { title: 'Webcam Filters', 
        description: 'Applies filters to webcam.  Use arrows',
        id: 'webcam'
      },
      { title: 'Particle Engine', 
        description: 'Makes spiral-like pattern with star gifs.  Use arrows & pg up/pg down',
        id: 'stars'
      },
      { title: 'Procedurally Textured Box Cluster', 
        description: 'Uses procedural texturing on a bunch of boxes.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        id: 'boxes'
      },
      { title: 'Procedurally Textured Box', 
        description: 'Uses procedural texturing on a single box.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        id: 'procedural'
      },
      { title: 'Positional Shading', 
        description: 'Colors box based on position on screen.  Use arrows & pg up/pg down, w, a, s, d, q, e',
        id: 'box'
      },
      { title: 'Hello World', 
        description: 'Just a box and a pyramid.  Use arrows & pg up/pg down',
        id: 'basic'
      }
    ]
  end
	def show
		render params[:id], layout: false
	end
end
