recipe liked form 

<div class= 'liked_form'>
<%= form_for [current_user, recipe], html: {class: "liked"} do |f| %>
  <% if recipe.liked? %>
    <%= f.hidden_field :liked, value: false %>
    <%= f.button '<i class="fas fa-heart"></i>'.html_safe, class:'liked'%>
  <% else %>
    <%= f.hidden_field :liked, value: true %>
    <%= f.button '<i class="far fa-heart"></i>'.html_safe, class:'liked' %>
  <% end %>
<% end %>
</div>