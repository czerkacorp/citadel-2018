class AccountFormService
  def self.filter(form_params)
    new(form_params).filter_relevant
  end
  
  def initialize(form_params)
    @form_params = form_params
    @account_params = Hash.new
  end

  def filter_relevant
    @account_params[:username] = @form_params[:name]
    if @form_params.has_key?(:password) then
      @account_params[:password] = @form_params[:password]
      @account_params[:salt] = @form_params[:salt]
    end
    return @account_params
  end
end