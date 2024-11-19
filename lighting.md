---
title: 'Lighting'
teaching: 30
exercises: 10
---

### Group 5: Cerrudo Carlos, Duke Harry, Parker Luk, Taylor Tom
:::::::::::::::::::::::::::::::::::::: questions 

- What are the basic types and parameters of lighting in a VR environment?
- How can good quality lighting effects (e.g. shadows) be achieved?
Shadows in our engine are quite easy to achieve, simply requiring us to tick to have shadows remain on. 
- How do(es) lighting affect performance of the environment?


::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain the basics of lighting in VR environments
In unreal engine, lighting is determined via lights, with a few different forms.
Firstly Directional Lights, which provide an even lighting to every object in the world, so that things do not become impossible to see, acting like sun or moon light.
Secondly, point lights. These lights shed light and create shadows, only within the radius of the light, similar to a light bulb.
Thirdly, spot lights. These shed light in a beam in the direction they are pointed, similar to a torch, or a … spotlight.
Fourthly, there are rect lights. These lights are similar to spotlights in that they are directional, but rather than being a narrow circular beam, sheds light evenly in one full direction, and sheds no light in the other.
Lastly there is the sky light. This captures distant parts of the scene as a light, allowing for reflections from far away objects.

- Demonstrate the implementation of basic lighting

Lighting in our engine is split into 3 categories. Static lighting, which is built into the level, “staining” the nearby objects with the lights and shadows, stationary, which is similar to static but can have the colour of the light and its intensity changed in game, affecting the precalculated areas accordingly ,and Moveable light, which affects performance the most, as it is calculated constantly.

Image depicted is an image of the unreal engine UI, showing options for moving lighting, along with increasing lighting intensity and changing colour

Image depicted is an image of a roofed room with no walls, a single cube being lit by a white light, leaving a slight shadow

Its as simple as dragging the lights into the scene!






- Explore how to create good lighting including shadows
As mentioned before, shadows are mostly done automatically.

Image depicted is a tall blue cuboid, lit by two lights, a regular white light, and a blue light. Both lights leave shadows on the floor beyond the cuboid. 

If we place multiple lights, and allow multiple colours and shadows, we can even make effects like this!

P.S: if the images arent working and you care to see them, this page was initially made in a google doc before being moved to the github, which you can see here:
https://docs.google.com/document/d/17qecks9vGGlSdth5WDNPVyfNEDSwsjC8U8vOUxU4Rvg/edit?usp=sharing

::::::::::::::::::::::::::::::::::::::::::::::::
