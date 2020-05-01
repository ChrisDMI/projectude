class FormulaireController < ApplicationController
  def index
  	@contact = Formulaire.new(params[:formulaire])
  end

  def create
    @contact = Formulaire.new(params[:formulaire])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Formulaire.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Merci pour votre message. Nous revenons vers vous très vite!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Le message n'a pas été envoyé." }
      end
    end
  end

end
