<%= @l %>:
  <%= plural_name %>:
    attributes:
<% @attributes.each do |attribute| -%>
      <%= attribute %>: <%= @t.localize(attribute.humanize, @l) %>
<% end -%> 

    controller:
      create: <%= @t.localize("#{human_name} was successfully created", @l) %>
      update: <%= @t.localize("#{human_name} was successfully updated", @l) %>
      destroy: <%= @t.localize("#{human_name} was successfully destroyed", @l) %>

    index:
      page_title: <%= @t.localize("Listing #{plural_name}", @l) %>
      h1_title: <%= @t.localize("Listing #{plural_name}", @l) %>
      new: <%= @t.localize("New #{human_name}", @l) %>
      no_book: <%= @t.localize("No #{human_name} found", @l) %>

    show:
      page_title: "<%= @t.localize("#{human_name} #%{id} detail", @l) %>"
      h1_title_lead: <%= @t.localize("#{human_name} detail", @l) %>
      h1_title: "<%= @t.localize("#{human_name} #%{id}", @l) %>"
      index_button: <%= @t.localize("Listing #{plural_name}", @l) %>
<% @attributes.each do |attribute| -%>
      <%= attribute %>: <%= @t.localize(attribute.humanize, @l) %>
<% end -%>

    edit:
      page_title: "<%= @t.localize("Edit #{human_name} #%{id}", @l) %>"
      breadcrumb_title: "<%= @t.localize(human_name, @l) %> #%{id}"
      h1_title: "<%= @t.localize("Edit #{human_name}", @l) %> #%{id}"

    new:
      page_title: "<%= @t.localize("New #{human_name}", @l) %>"
      h1_title: "<%= @t.localize("New #{human_name}", @l) %>"

    breadcrumb:
      index: <%= @t.localize("Listing #{plural_name}", @l) %>
      edit:
        detail: "<%= @t.localize(human_name, @l) %> #%{id}"
        title: <%= @t.localize("Edit", @l) %>
      new:
        title: <%= @t.localize("New", @l) %>

    form:
      save: <%= @t.localize("Save", @l) %>
      cancel: <%= @t.localize("Cancel", @l) %>


# --- Form labels:
  helpers:
    label:
      <%= singular_name %>:
<% @attributes.each do |attribute| -%>
        <%= attribute %>: <%= @t.localize(attribute.humanize, @l) %>
<% end -%>
