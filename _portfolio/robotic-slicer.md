---
title: "Robotic Vegetable Slicer for Impaired Users"
excerpt: "<img src='/images/robotic-slicer/robotic-slicer-final.jpg' style='width:400px;'><br>I developed a robotic vegetable slicer to assist users with limited mobility in food preparation tasks"
collection: portfolio
date: 2025-10-21 00:00:00
last_modified_at: 2025-11-06 00:00:00
---
![Robotic Slicer](/images/robotic-slicer/robotic-slicer-final.jpg)\
Figure 1. The robotic vegetable slicer prototype, featuring a motorized blade and feeder mechanism

# Background
The requirements for this project were to design and build a robotic vegetable slicer that users with limited mobility could operate. The device needed to be safe, easy to use, and capable of slicing various types of vegetables. With the flick of a switch, a motor would be able to feed and slice a fruit or vegetable.

## Provided Materials
We were provided with a motor, switch, two axles, an AA battery pack, and $100 worth of materials for a student shop, which had an inventory of materials relevant to mechanical engineering design classes.
Here were some machines we had access to for this project:
* 3D printing - Ultimaker Cura 5 printers and PLA
* Laser cutting - Epilog laser cutter (forgot which model)

Here were some notable parts and materials I used most in this project:
* 1/8" Polycarbonate
* PLA
* 1/4" flanged sleeve bronze bearings

There were some requirements like the slicer had to cut items with a maximum of 2-inch diameter, it must be powered only by the given motor and battery pack. It must be able to cut a variety of fruit and vegetables, each of which presents its own challenges.

I take credit for the design of this project. Some assembly and manufacturing was performed by another group member, but most was done by me. The project took about 2 months to complete.

# Design
![CAD Assembly](/images/robotic-slicer/Assembly_CAD.png)
Figure 2. CAD assembly of the robotic slicer prototype

The overall CAD assembly of the slicer is shown in figure 2. Almost all of the components were placed into the assembly, with the exception of screws and nuts. Everything that was 3D printed or laser cut was inserted into the assembly. For this project I used Fusion 360 since it is free for students and has OK collaboration features.

## Moving Components
![alt text](/images/robotic-slicer/dynamic-components.png)
Here is an overview of the moving components in the slicer. It can be broken down into 3 main components. The gearbox, the indexer (yellow horizontal axel) and the cutter (green blade).

From this view, you can clearly see that I overcomplicated this design, and I should have made it way simpler. I have highlighted the two axles in yellow. The two-tooth gear for the indexer is in green, along with the knife blade.

The assembly contains 6 bevel gears, which was a huge regret. It ended up overcomplicating the system and causing way too much friction and DOFs for the project requirements. 

### Gear Train

The gear train is a 16:1 set of polycarbonate gears. The small diameter gears are 12T laser cut from 1/4" polycarbonate, and the large diameter gears are 24T laser cut from 1/8" polycarbonate. The gears free-spin on an M5 screw, so to rigidly attach the gears to each other, I made small, triangular pin holes and shims for the gears.

I designed the gears using Fusion's built-in gear generator add-on. The gears and M5 screws that the gears free spun on were held by two polycarbonate plates, which you can see in previous images. The 1/8" polycarbonate I chose was too thin, and I had a very hard time getting a consistent mesh with other 1/8" gears. I found some 1/4" polycarbonate lying around that I made thicker 12T gears from.

The low meshing was one of the reasons why I should have opted for more 3D printing in my build - in fact, since there were no penalties for complex 3D geometries that are not manufacturable using traditional methods, it was best to 3D print everything.

The final gear in the train is a 24T polycarbonate gear with a D shape to rigidly attach to the D shaft. This was a major mistake and a huge flaw in my design. Luckily, I had no cracking during my project, but looking back, this should have definitely been 3D printed with a set screw to screw into the D shaft.

The motor was held in place using a chassis that was 3D printed.

### Cutter

![Horizontal Cutter View](/images/robotic-slicer/cutter-front.png)
Figure 3. Horizontal view of the cutter mechanism

The cutter mechanism is powered by a D-shaft that transfers the rotational energy all the way from the bottom of the assembly to the top where the top gears are.

![alt text](/images/robotic-slicer/cutter-iso-front.png)
Figure 4. Isotropic view of the feeder and cutter

This second view in figure 4 helps depict how the blade would cut onto a fruit or vegetable when working with the indexer. The blade is held in place by a custom PLA piece in gray that slides along two wooden dowels. The blade is a standard box cutting blade.

![alt text](/images/robotic-slicer/cutter-iso-rear.png)

Figure 5. Isotropic view of the back of the cutter mechanism

![alt text](/images/robotic-slicer/cutter-rear.png)

Figure 6. Plane view of the cutter and indexer mechanism

In Figures 5 and 6, the cutter can be seen slicing without interfering with the indexer. The gray blade holder was designed with four contact points along the dowels, positioned to allow the full 2-inch cutting range of motion while maintaining rigidity. Although the blade translation accommodates only a 2-inch item, the diagonal orientation of the blade means that both the blade and holder actually translate more than 2 inches in total travel distance.

### Indexer

![alt text](/images/robotic-slicer/indexer-iso.png)

Figure 7. Isotropic view of the indexer mechanism

![alt text](/images/robotic-slicer/indexer-side.png)

Figure 8. Side view of the indexer mechanism

![alt text](/images/robotic-slicer/indexer-iso-no-housing.png)

Figure 9. Isotropic view of the indexer mechanism without housing

![alt text](/images/robotic-slicer/indexer-side-no-housing.png)

Figure 10. Side view of the indexer mechanism without housing

![alt text](/images/robotic-slicer/indexer-gear-close-up.png)

Figure 11. Close-up view of the indexer gear

Figures 7-11 feature the indexer mechanism. The red indexing piece is a custom 3D printed piece that is constrained axially. The thin end rests on the green 2 tooth gear and the wide red end that serves as a backstop simply rests on the yellow indexer housing. To ensure the red piece is meshing with the green gear, there is a small structure that prevents the long red rod from tilting upwards. This piece is best observed in Figure 4.

# Results
The slicer performed ok during the final presentation. It met the requirements of cutting foods like a banana, a cucumber, and celery.

# Takeaways

This project taught me several valuable lessons about design, materials, and tradeoffs:

**1. Keep the design simple and minimize friction.**

Complexity often introduced more problems than it solved.

**2. Gravity-fed slicers worked best.**

They were significantly easier to design, build, and test compared to motor-driven or mechanically actuated versions.

**3. Maximize the use of 3D printing.**

Rapid iteration through printed parts helped identify mechanical weaknesses early and refine the system efficiently.

**4. Avoid polycarbonate for structural parts.**

While PC was quick to manufacture and offered higher strength than PLA, its low thickness made it offered terrible meshing especially with the tolerances we had on a prototype system.
PLA gears, in contrast, could be printed thicker and provided better meshing performance under torque.

**5. Design for functionality, not manufacturability.**

There was no advantage to optimizing for mass production. Teams that used monolithic printed chassis avoided alignment issues and bending, while also achieving stronger gear meshing for high-torque slicing.

**6. Effective slicing motion matters.**

The most successful designs replicated a natural slicing motion. My attempt with a four-bar linkage was insightful but ultimately ineffective—highlighting how difficult it is to translate theory into precise mechanical motion.

# Changes
Given what I know now, I would have made significant changes to my design. This is one of my favorite parts of engineering, as soon as you make something, you see 10 different things you want to change to make it better.

In short I would:
- Reduce friction, get rid of bevel gears
- 3D print everything
- Design a gravity indexing mechanism

## Slicing Mechanics
A slicing motion with a knife is more effective than a forceful straight push because it uses the blade’s length, allowing the edge to separate material efficiently with less force. This technique mimics common kitchen cutting motions, where the knife moves both downward and in a parallel direction along the food, creating a “shearing” action instead of a crushing one.

Part of this project included a lab involving a scale to measure force, where we could experimentally prove that slicing requires significantly less effort than pushing straight down. Mechanically, a slicing motion moves the blade in both the vertical and horizontal directions, maximizing the cutting efficiency while minimizing the required pressure. This approach leads to cleaner cuts and reduces damage to the material being sliced. This, however, increased the complexity of the design.

I tried to emulate a slicing motion by angling the blade similar to a guillotine. I think it would have been fun if I designed the blade to be weighted and have a partially toothless gear to drop the blade down when slicing.

![alt text](/images/robotic-slicer/cutter-front.png)

The way I constrained the blade did not help support the mechanics. In fact, it created a lot of friction due to the large normal forces on the pole walls. The gray blade holder was a single piece of PLA that slid along two wooden dowels. At the time, I thought this was a creative way to constrain the blade on two of its translational axes. Looking back, when the green blade tries to slice something, the force from the blade and blade holder creates a large normal force on the dowels, which creates a lot of friction. It did not help that one requirement we had was that the slicer had to accommodate a 2-inch fruit or vegetable, which made designing linkages that a 4-inch blade could cut fairly complex. In hindsight, it would be better to forgo any points or testing of a 2-inch diameter food for a more effective and easier to implement slicing motion.

There are a lot of better designs for all of my components. I thought the kinematics of a four-bar and its torque was quite complex when learning this class for the first time, along with a large group project and other technical classes.

# Main Redesigns

I think I could redesign this system to cut vegetables with ease with what I know now. The two main subsystems I would redesign from the ground up would be the slicing and indexing mechanisms.

## Slicing Mechanism
My goal would be to try to design a four-bar linkage system that could effectively slice. Let's focus exclusively on this system since it is the hardest to design and the most important part of the design.
I can concisely list out my constraints as:
* Powered by a single motor that must continuously revolve
* Must be able to cut a variety of fruits and vegetables with a maximum diameter of 2 inches
* Optimize the torque curve to be in line with cutting requirements throughout blade motion

## Indexing mechanism
The requirements the teacher had given for this project did not require an active mechanism for indexing. In hindsight, I should have used a gravity-based indexing mechanism. I would have cut down on 6 of the bevel gears I over-engineered into my system. I failed an important rule of engineering: KISS - "Keep it simple stupid".