class <%= controller_class_name %>Controller < ApplicationController
  # GET <%= route_url %>
  # GET <%= route_url %>.xml
  def index
    @search = <%= class_name %>.search(params[:search])
    @<%= plural_table_name %> = @search.order(sort_options).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @<%= plural_table_name %> }
      format.js
    end
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.xml
  def show
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @<%= singular_table_name %> }
      format.js   { render :file => '<%= plural_table_name %>/show', :locals => {:remote => true} }
    end
  end

  # GET <%= route_url %>/new
  # GET <%= route_url %>/new.xml
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @<%= singular_table_name %> }
      format.js
    end
  end

  # GET <%= route_url %>/1/edit
  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.xml
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to(@<%= singular_table_name %>, :notice => t('<%= plural_table_name %>.create.flash')) }
        format.xml  { render :xml => @<%= singular_table_name %>, :status => :created, :location => @<%= singular_table_name %> }
        format.js   { @flash_notice = t('<%= plural_table_name %>.create.flash') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @<%= orm_instance.errors %>, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.xml
  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to(@<%= singular_table_name %>, :notice => t('<%= plural_table_name %>.update.flash')) }
        format.xml  { head :ok }
        format.js   { @flash_notice = t('<%= plural_table_name %>.create.flash') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= orm_instance.errors %>, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.xml
  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to(<%= index_helper %>_url) }
      format.xml  { head :ok }
      format.js
      format.js   { render :inline => "live_search()"}
    end
  end
end