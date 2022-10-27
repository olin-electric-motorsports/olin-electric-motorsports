# KiCad Parts
KiCad library employed by Olin Electric Motorsports electrical team.

## Libraries

We are starting a fresh KiCad libraries for Mk. 6. The goal is to ensure that we do not incorporate components that are not stocked and to increase the quality and consistency of our libraries. The new library allows us to better track the status of components and support multiple purchasing options.

| Path | Description |
| ---- | ----------- |
| `/parts/3DModels/` | 3D Models for Mk. 5 era |
| `/parts/footprints.pretty/` | Footprints library for Mk. 5 era |
| `/parts/schematic/formula.kicad_sym` | Schematic symbol library for Mk. 5 era |
| `/parts/mk6.3dshapes/` | 3D Models for Mk. 6 |
| `/parts/mk6.pretty/` | Footprints library for Mk. 6 |
| `/parts/schematic/mk6.kicad_sym` | Schematic symbol library for Mk. 6|


## Guidelines

> Note: Some older parts do not follow this guidelines completely. For this reason, double check when copying over any legacy components.

1. General symbol naming guidelines

    * Fields that must be included (Example for _STM32F439BI_)
         * Reference (e.g., `U`)
         * Value (e.g., `STM32F439BI`)
         * Footprint (e.g., `Housings_QFP:LQFP-208_28x28mm_Pitch0.5mm`)
         * Datasheet (e.g., `https://www.st.com/content/ccc/resource/technical/document/datasheet/fd/8c/0a/19/13/8f/41/99/DM00077036.pdf/files/DM00077036.pdf/jcr:content/translations/en.DM00077036.pdf`)
         * MFN, or Manufacturer Name (e.g., `ST`)
         * MPN, or Manufacturer Part Number (e.g., `STM32F439BIT6`)
         * PurchasingLink (e.g, `https://www.digikey.com/product-detail/en/stmicroelectronics/STM32F439BIT6/497-17468-ND/5268309`)

    * Library naming should not be duplicated in footprint name

    * If symbol with same name exists for multiple manufacturers, the manufacturer name is written first

    * Specific manufacturer name (for atomic parts)
    
    * Type of symbol (for generic parts)
    
    * May be shortened for common components (e.g. `Conn` for Connector)

    * Reference designator may be substituted for common components (e.g. `D`, `C`, `LED`)

    * Part name should include extension for specific footprint if required (e.g. `SOIC`)

    * Any modification of the original symbol, indicated by appending the reason (e.g. different pin ordering - `Q_NPN_CBE`, `Q_NPN_BCE`)

    * Indicate quantity of elements for symbol arrays (e.g. resistor array with 8 elements - `Resistor_x8`)

2. General footprint naming guidelines

    Each footprint is a `.kicad_mod` file (stored within a `.pretty` directory). The naming convention for a given footprint depends largely on the type of footprint, however a general guide is presented below:

    * Specific package type is written first, e.g.

        * `QFN` - Quad Flat No-Lead package

        * `C` - Capacitor

    * Package name and number of pins are separated by a hyphen

        * `TO-90`

        * `QFN-48`

        * `DIP-20`

    * Unique fields (parameters) in the footprint name are separated by _ character.

    * Package dimensions are specified as length x width (and optionally height)

        * `3.5x3.5x0.2mm`

        * `1x1in`

        * If necessary for clarity, footprint body dimensions may be prefixed with a leading `B`

    * Pin layout

        * `1x10`

        * `2x15`

    * Pitch is specified with a leading P:

        * `P1.27mm` - 1.27mm pitch

        * `P5.0mm` - 5.0mm pitch

    * Modifiers to standard footprint values (Required only when there is a modification)

        * `Drill1.25mm`

        * `Pad2.4x5.2mm`

    * Orientation e.g. `Horizontal`, `Vertical`

    * Any modification to the original footprint, indicated by appending the reason
   
        * `_HandSoldering`

        * `_ThermalVias`

    * Examples from the library.
         * `LQFP-208_28x28mm_P0.5mm`
         * `DFN-6-1EP_2x2mm_P0.5mm`
         * `Samtec_LSHM-110-xx.x-x-DV-S_2x10-1SH_P0.50mm_Vertical`
         * `Molex_PicoBlade_53261-0271_1x02-1MP_P1.25mm_Horizontal`
         
    * You can find some of the standard footprints already made [here](https://github.com/KiCad/kicad-footprints).

* 3D Model Naming Guidlines

    The name of the folder for 3D Models should match the footprint name.

Guidelines are based off [KiCad Library Convention](https://klc.kicad.org/).
