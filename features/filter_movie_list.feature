Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: restrict to movies with 'PG' or 'R' ratings
  Given I am on the RottenPotatoes home page
  When I check the following ratings: PG, R
  When I uncheck the following ratings: G, PG-13
  When I press "ratings_submit"
  Then should see "The Terminator"
  Then should see "When Harry Met Sally"
  Then should see "Amelie"
  Then should see "The Incredibles"
  Then should see "Raiders of the Lost Ark"
  Then should not see "Aladdin"
  Then should not see "The Help"
  Then should not see "Chocolat" 
  Then should not see "2001: A Space Odyssey"
  Then should not see "Chicken Run" 
 


Scenario: all ratings selected
  Given I am on the RottenPotatoes home page
  When I check the following ratings: G, R, PG, PG-13
  When I press "ratings_submit"
  Then I should see all the movies
  