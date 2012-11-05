Feature: Snippets
  As a site owner
  In order to improve my site navigation
  I want to be able to search among contents

Background:
  Given I have the site: "test site" set up
  And a page named "Please search for this" with the template:
    """
      This is what you were looking for
    """
  And a page named "search" with the template:
    """
      <ul>
      {% for result in site.search %}
        <li><a href="{{result.slug}}">{{ result.title }}</a></li>
      {% endfor %}
      </ul>
    """
  And I update the "index" page with the template:
    """
      <form action="/{{ locale }}/search" method="GET">
        <label for="search">Search</label>
        <input type="text" name="search" id="search">
        <input type="submit" value="Search">
      </form>
    """
  And I have the site: "another site" set up
  And a page named "This should never show up in the search" in the site "Locomotive test website #2" with the body:
    """
      Rickroll
    """
    
Scenario: Searching in a single site
  When I go to the homepage
  And I fill in "Search" with "search"
  And I press "Search"
  Then I should see "Please search for this"
  And I should not see "This should never show up"
  And I should not see "search results"
  When I follow "Please search for this"
  Then I should see "This is what you were looking for"
  
Scenario: Searching for 404 page
  When I go to the homepage
  And I fill in "Search" with "not found"
  And I press "Search"
  Then I should not see "Page not found"