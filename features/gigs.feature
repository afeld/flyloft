Feature: Gigs
  Scenario: Increment view count on show
    Given gigs with the following view counts:
      |0|
      |3|
      |15|
    When I visit each gig
    Then the view counts should be:
      |1|
      |4|
      |16|
