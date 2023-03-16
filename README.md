## AC31009 Week 9 - Reusable Components - Godot Example
This the small sample project used in the Week 9 seminar on Reusable Components. 

The `main` branch contains the base game. In the `with-scenes` branch, Scenes have been created for the turrets with an inherited Scene created for large turrets. The Healthbar from the player has also been refactored in to a scene, and a Health node (see `Health.gd`) extracted so that the Healthbar can also be used with the turrets. See the weekly seminar slides for the relevant diagrams.