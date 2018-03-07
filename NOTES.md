config.scoped_views (initializers/devise.rb) is set to true to allow for customization of devise user views. SET TO FALSE if no customization.




Help setting up admin role. (Pundit/CanCanCan/other)


Storing photos in a database (for both the photo class and potentially for the category class)
--Paperclip!


Permission Problems. Having trouble authorizing users to be able to edit their reviews.
XXXX--My nested parameters are showing up incorrectly in the url. http://localhost:3000/activities/6/reviews/3/edit SHOULD be editing review with id of 3 and activity_id of 6, but it is the other way around

Eventually add Geocoder and include Google Map pins for activity locations.

I have set up activities to belong_to a location (optionally), do i NEED to set up the other side of that association with either a has_one or has_many for the location model??

Upload up to 3 images when an activity is created?

XXXX STRUGGLING WITH MY CUSTOM ACCEPTS NESTED ATTRIBUTES METHODS. How to Edit Location from activity edit form? Location parameters all show up blank in activity edit form. Should someone even be able to edit a location from that form??

CONTEXT: NEW LOCATION FORM
XXXX-- Description text_areas showing up outlined in red as if surrounded by field_with_errors.

XXXX--How do I get category tags to show up for each activity? (I almost have to go into a double nesting scenario, which seems crazy.)

XXXX-- New Activities are not being saved

CONTEXT: LOCATION SHOW PAGE
XXXX--regardless of URL params, always displaying card for Location[1]

CONTEXT: CUSTOM [ACCEPTS_NESTED_ATTRIBUTES] IN LOCATION.RB
XXXX-- params hash is a little off, had to Juryrig method to chain .last to get desired result.

CONTEXT: LOCATION SHOW PAGE
XXXX -- activity cards showing up in a single column rather than 3 column structure

CONTEXT: LOCATION EDIT FORM
XXXX-- Activities are resaved as new rows
XXXX-- If i try to update an activity it creates a new activity


CONTEXT: HOME PAGE CSS
XXXX-- New activity button shifts outside of container in smaller viewports
-- LETS ADD A FOOTER
-- Bootstrap col's are not defaulting to equal height.. WHY?!

CONTEXT: ACTIVITY SHOW PAGE
XXXX-- New review button shifts outside of container in smaller viewports

ACTIVITY AVG_RATING 
