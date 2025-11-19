---
title: "Liquid Cooling Test Bench for Collins Aerospace"
excerpt: "<img src='/images/immersion-cooling-project/flow-loop.png'><br>Designed and built a test bench for a power module and oil-based coolant to study the effects of immersion cooling, as part of a Senior Design Project. The project involved developing procedures, performing tests, and providing a series of recommendations in a technical report."
collection: portfolio
date: 2025-09-17 00:00:00
last_modified_at: 2025-11-06 00:00:00
---
![Flow Loop](/images/immersion-cooling-project/flow-loop.png)\
Figure 1. Enclosure where power electronics and thermocouples are mounted in a container with coolant running through it

**Key Features:**
- Designed and built a test bench for a 200W power module and oil-based coolant to study the effects of immersion cooling
- Developing procedures and performing tests between 20 to 150˚C and measuring heat transfer from the module to the coolant
- Tested bench and recorded data using a design of experiments varying power, setup orientation, and flow velocity

**Technologies Used:**
- ANSYS IcePak
- LabVIEW

**Results:**
- A budget-friendly functional flow loop built from easy-to-source parts
- An initial simulation was developed in ANSYS Icepak, which modeled real-world findings
- A series of recommendations was provided in a technical report if Collins were to pursue this project further

![Annotated Assembly](/images/immersion-cooling-project/annotated-470-project.png)\
Figure 2. An annotated assembly of all of the components involved

A Power Electronics Module (PEM) is a collection of semiconductor components designed to deliver high electrical power for onboard aircraft systems. Due to the significant power demands of a PEM, Collins Aerospace sought to investigate the feasibility of liquid cooling as a means to improve thermal performance and reduce system weight. To explore this concept, they partnered with the University of Illinois, where a team of five senior students—including myself—developed a minimum viable product as part of our Senior Design Project. The PEM used in our prototype was rated for up to 900 W of power dissipation; however, due to safety considerations and power supply limitations, it was throttled to 200 W of heat generation during testing. In Figure 2, an overall completed project assembly with annotations is shown. In Figure 1, a picture focusing on the completed assembly is shown.

![Schematic](/images/immersion-cooling-project/schematic.png)\
Figure 3. A brainstorm of the design

The core product for Collins Aerospace was a power electronics module which were provided and expected to power, cool, and monitor. In Figure 3, you can see this core deliverable. The container contains the PEM, while the hose inlets and outlets cool the PEM. On top, there is a lid that has access points for wiring, like thermocouples and cables to power the PEM.

From the hoses, coolant was pumped using a dual pump and heat exchanger system (labeled as pump in Figure 2). This allowed for the coolant to be cooled to specific temperatures to allow for more extensive testing.

![CAD Assembly](/images/immersion-cooling-project/cad-assembly.png)\
Figure 4. Final CAD Assembly

The final CAD of the assembly included much of the original brainstormed design. Figure 4 shows a CAD assembly that includes the integration of the parts we ended up purchasing from online suppliers. 

The enclosure was built from scratch using commercial off-the-shelf (COTS) parts with slight modifications that can be done in any machine shop. The team was tasked with finding a dielectric coolant with a boiling point of greater than 200˚C to ensure single-phase convection.

![PEM Thermocouples](/images/immersion-cooling-project/modified-pem.png)\
Figure 5. The transistors of the PEM are actually exposed to increase the efficacy of heat transfer during immersion cooling

Figures 5 and 6 show how the electronics are directly attached to the PEM. In Figure 5, there are wires for powering the transistors of the PEM; the main power bus is from the two large copper terminals on the left. 00 gauge wire was screwed into the terminals using 1/4" bolts.


![PEM Thermocouples](/images/immersion-cooling-project/thermocouples-mounted.png)\
Figure 6. Thermocouples were mounted onto the back of the PEM using Kaptan (electrically resistant) Tape

In Figure 6, the back of the PEM is displayed, showing where thermocouples were placed to probe the temperature of the PEM in different locations. The thermocouples were electrically insulated and thermally conductive using Kapton tape. 

![Labview](/images/immersion-cooling-project/labview-vi.png)
Figure 7. LabVIEW Block Diagram for reading thermocouples

Figure 7 shows the LabVIEW block diagram that was used to read the thermocouples. The team used a National Instruments NI-9214 thermocouple DAQ (Data Acquisition) to get readings from the thermocouples into LabVIEW.


![Data](/images/immersion-cooling-project/data-recorded.png)\
Figure 8. One Temperature vs. Time graph retrieved from our experiments

After constructing a test article, the team was tasked with conducting experiments to study the following convection conditions
- Single-phase convection
- Forced & natural convection
- Steady and transient conditions

In Figure 8, one of the temperature vs. time graphs is recorded from our experiments.

The final product was then safely packed and shipped to the Collins Aerospace office in Rockford, IL.