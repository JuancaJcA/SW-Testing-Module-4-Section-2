Feature: Project
  Scenario: As a user I want to create a User and from that create, update and delete a project

    Given send POST request "/api/user.json" with config values
    When get authentication
    Then response code should be 200
    When send POST request "/api/projects.json" with body
    """
    {
      "Content": "Project",
      "Icon": 5
    }
    """
    Then response code should be 200
    And the attribute "Content" should be "Project"
    And save "Id" in the variable "$ID_PROJECT"
    When send PUT request "/api/projects/$ID_PROJECT.json" with body
    """
    {
      "Content": "Project2"
    }
    """
    Then response code should be 200
    And the attribute "Content" should be "Project2"
    When send DELETE request "/api/projects/$ID_PROJECT.json" with body
    """
    """
    Then response code should be 200
    And the attribute "Content" should be "Project2"