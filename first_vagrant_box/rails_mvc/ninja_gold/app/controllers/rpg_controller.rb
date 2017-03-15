class RpgController < ApplicationController

  def index
    session[:gold] ||= 0
    session[:log] ||= []
    @gold = session[:gold]
    @log = session[:log]
    puts '\n\n\n\n\n'
    puts "Total gold: #{@gold}"
    puts '\n\n\n\n\n'
  end

  def process_gold
    @color = 'green'
    @present = Time.new
    if params[:building] == 'farm'
      @new_gold = rand(10..20)
      puts '\n\n\n\n\n'
      puts "Farm gold: #{@new_gold}"
      puts '\n\n\n\n\n'
    elsif params[:buidling] == 'cave'
      @new_gold = rand(5..10)
      puts '\n\n\n\n\n'
      puts "Cave gold: #{@new_gold}"
      puts '\n\n\n\n\n'
    elsif params[:buidling] == 'house'
      @new_gold = rand(2..5)
      puts '\n\n\n\n\n'
      puts "House gold: #{@new_gold}"
      puts '\n\n\n\n\n'
    # elsif params[:buidling] == 'casino'
  else
      winnings = rand().round
      puts winnings
      if winnings == 1
        @new_gold = rand(0..50)
        session[:gold] += @new_gold
      else
        @new_gold = rand(-50..0)
        @color = 'red'
      end
      puts '\n\n\n\n\n'
      puts "Casino gold: #{@new_gold}"
      puts '\n\n\n\n\n'
    end

    session[:gold] += @new_gold
    if @color == 'red'
      session[:log] << "Lost #{@new_gold} gold from the #{params[:building]}... ouch ...#{@present.strftime("%b %e, %Y")}"
    else
      session[:log] << "Earned #{@new_gold} gold from the #{params[:building]}, nice! ... #{@present.strftime("%b %e, %Y")}"
    end

    redirect_to :root
  end

  def replay
    reset_session
    redirect_to :root
  end

end
