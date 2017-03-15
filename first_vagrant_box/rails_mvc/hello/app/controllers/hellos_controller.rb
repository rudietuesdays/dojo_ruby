class HellosController < ApplicationController
  def hello
      render text: 'hello coding dojo!'
  end

  def sayit
      render text: 'saying hello!'
  end

  def person
      unless params[:id]
          render text: 'saying hello!'
      else
          if params[:id] == 'michael'
              redirect_to '/say/hello/joe'
          else
              render text: "saying hello #{params[:id]}!"
          end
      end
  end

  def say
      render text: "What do you want me to say???"
  end

  def times
    session[:count] ||= 0

    render text: "You have visited this page #{session[:count] += 1} time(s)"
  end

  def restart
      session.clear
      render text: "Destroyed the session!"
  end
end
