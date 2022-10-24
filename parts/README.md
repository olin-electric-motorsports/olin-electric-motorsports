# OEM Parts
KiCad libraries employed by Olin Electric Motorsports electrical team.

# Setup

> Prior to Mk. VI we used a global library, however it was poorly maintained and many of the components are no longer available for purchase. New projects must use the OEM libraries.

Open KiCad. From the top bar, open up _Preferences > Manage Symbol Libraries..._. Add new rows to the table:

Nickname | Library Path
---|---
formula |`${OEM_DIR}/parts/schematic/formula.kicad_sym`
OEM | `${OEM_DIR}/parts/schematic/oem.kicad_sym`

From the top bar, open up _Preferences > Manage Footprint Libraries..._. Add new rows to the table:

Nickname | Library Path
---|---
footprints |`${OEM_DIR}/parts/footprints.pretty`
OEM | `${OEM_DIR}/parts/oem.pretty`


# Guidelines

## Symbols

Applies to all symbols in the `OEM` library. When a new schematic symbol is added it must be checked against these guidlines.

### Naming

For specific parts such as ICs, use the general part number (e.g. `ADBMS1818` not `ADBMS1818-WASZ-RL`). For passives and other generic components, a descriptive (e.g. `R_200`) name is suitable.

### Required Fields

Field | Example | Show |  Description
--- | --- | --- | ---
Reference | `R` | Y | [Letter corresponding to component type](https://klc.kicad.org/symbol/s6/s6.1/)
Value | `10K` | Y |  Value of component or part name
Footprint | `OEM:R_0805` | N | Reference to footprint for component
Datasheet | `https://www.example.com/.../datasheet.pdf` | N | Link to datasheet
MPN | `RCA080510K0FKEA` | N | Manufacturer Part Number for ordering
MFN | `Vishay` | N | Manufacturer (not to be confused with distributors like digikey)
ReorderAt | `50` | N | Approximate quantity at which to order more, 0 if additional units should not be ordered
SuggestedQuantity `100` | N | Suggestion for quantity to order when running low
Location | `Bin 7, A12` | N | Set once components arrive, location in storage
NewDesigns | `Yes` | N | If the component should be used in new designs. If a component should not be used set to `DO NOT USE` and enable `Show`.

### Required Metadata

Property | Notes
--- | ---
Symbol Name | Do not include formula, OEM, MkVI, etc.
Description | Part description for search
Keywords | Comma separated list of search terms

### Component Specific Fields

In addition to the required fields, some component types have additional required fields to help with design reviews. If there is any specification you think is important to the component, add it as a field in addition to the required fields.

#### ICs

Field | Example | Show |  Description
--- | --- | --- | --- | 
SupplyVoltage | `2.5-5.5V` | N | The supply voltage for the IC
LogicLevel | `5V` | N | If applicable, the logic level for IO

#### Connectors

Field | Example | Show |  Description
--- | --- | --- | --- | 
RatedVoltage | `600VDC` | N | Rated voltage - must be documented in datasheet or link source
ContactCurrent | `.8A` | N | Rated current per contact
MatesWith | `MPNABCD` | N | Symbol name of mating connector. If there are multiple mating connectors `MatesWithAltX` fields may be added.


#### Passives

The relevant specifications vary for different passives. Make sure any specifications that were relevnt to your selection are included as fields and listed in the description. This makes finding suitable alternatives easier if there are supply issues.

### Symbol Design

1. If multiple pins should **always** be connected together, use [pin stacking](https://klc.kicad.org/symbol/s4/s4.3/).
    - Do not stack power pins if they require seprate decoupling capacitors
1. Pin orientation
    * Power pins must be placed on the top of the symbol
    * GND pins must be placed on the bottom of the symbol
    * Input pins must be placed on the left of the symbol
    * Output pins must be placed on thr right of the symbol
    * For some components, pins can function as inputs or outputs. In this case they should be placed on the right of the component.
1. Pins should be grouped functionally, not based on pin order


## Footprints

Applies to all footprints in the `OEM` library. When a new footprint is added it must be checked against these guidlines.

Do not create footprints for specific components, create footprints for packages so that they can be reused. Add alternate package names to the description.

In the rare case that a component does not have a package name, the symbol name must be matched exactly.

When possible, use KiCad's built-in footprints and save a copy to the OEM library. This ensures our library is stable and updates to built in packages do not unexpectedly break anything.

### Naming

We loosely follow the [KiCad Library Conventions for footprint names](https://klc.kicad.org/footprint/f3/). Generally, we err on the side of slightly simpler, easier to remember footprint names.

For example, we omit the metric sizing in SMT passives (i.e. `R_0805` instead of `R_0805_2012Metric`).

For connectors, we follow `[Series]_[PinLayout]_[Orientation]`. For example, `MicroFit_2x4_RA`.

Orientation | Shorthand
--- | ---
Vertical | VT
Horizontal | RA
45 degree | 45

### Required Fields

Field | Example | Show |  Description
--- | --- | --- | --- | 
Source `https://example.com/.../mpn.pdf` | N | Datasheet with footprint drawing.

### Required Metadata

Property | Notes
--- | ---
Symbol Name | Do not include formula, OEM, MkVI, etc.
Description | Part description for search. Include alternate package names
Keywords | Comma separated list of search terms

### Footprint Design
Getting footprints online is encouraged, but sometimes they aren't perfect.

1. On ICs, Pin 1 must be marked with two dots and an extended line over the pin. The dots must have a radius of 0.3mm.

    ![screenshot of properly marked footprint](./docs/pin1_marking.png)
1. For polar components, the component outline must not extend around the anode. Additional markings should not be used.

    ![screenshot of diode with marking](./docs/diode_marking.png)
1. Through hole components must indicate pin 1 with a square pad.

    ![screenshot of properly marked footprint](./docs/tht_marking.png)
1. Silksreen designs in component footprints must be drawn with a line width of 0.12mm.

1. The reference designator should be set to the `User.Comments` layer to avoid cluttering the silkscreen.

## 3DModels

All footprints must include a 3D Model.

All 3D Models must be placed in the `OEM.3dshapes`. Do not create subdirectories for individual 3D models. Add only the 3D model files required for each component. The name of each file must match the associated footprint. If multiple footprints use the same 3D model, the name should match the most generic footprint.

If possible, models should not require positioning or scaling to match the footprint.

