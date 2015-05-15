module ApplicationHelper
    
    def add_book_link(text, book)
        link_to text, {:url => {:controller => "cart", :action => "add", :id => book}, :remote => true}, {:title => "Add to Cart", :href => url_for( :controller => "cart", :action => "add", :id => book)}
    end
    
    def remove_book_link(text, book)
        link_to text, {:url => {:controller => "cart", :action => "remove", :id => book}, :remote => true}, {:title => "Remove book", :href => url_for( :controller => "cart", :action => "remove", :id => book)}
    end
    
    def clear_cart_link(text = "<h2><span class='glyphicon glyphicon-trash'></span> Clear cart</h2>".html_safe)
        link_to text, {:url => { :controller => "cart", :action => "clear" }, :remote => true}, {:href => url_for(:controller => "cart", :action => "clear")}
    end
    
    
def flash_class(level)
        case level
          when 'notice' then "alert alert-info"
          when 'success' then "alert alert-success"
          when 'error' then "alert alert-danger"
          when 'alert' then "alert alert-warning"
        end
      end
              
def this_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
                        
    
end
