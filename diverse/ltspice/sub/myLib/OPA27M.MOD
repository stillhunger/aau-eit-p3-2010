* OPA27M OPERATIONAL AMPLIFIER "MACROMODEL" SUBCIRCUIT

* "M" IS  MULTIPLE POLE/ZERO TOPOLOGY

* CREATED 7/8/92 BCB

* REV.A

*

*  ------------------------------------------------------------------------ 

* |  NOTICE: THE INFORMATION PROVIDED HEREIN IS BELIEVED TO BE RELIABLE;   |

* |  HOWEVER; BURR-BROWN ASSUMES NO RESPONSIBILITY FOR INACCURACIES OR     |

* |  OMISSIONS.  BURR-BROWN ASSUMES NO RESPONSIBILITY FOR THE USE OF THIS  |

* |  INFORMATION, AND ALL USE OF SUCH INFORMATION SHALL BE ENTIRELY AT     |

* |  THE USER'S OWN RISK.  NO PATENT RIGHTS OR LICENSES TO ANY OF THE      |

* |  CIRCUITS DESCRIBED HEREIN ARE IMPLIED OR GRANTED TO ANY THIRD PARTY.  |

* |  BURR-BROWN DOES NOT AUTHORIZE OR WARRANT ANY BURR-BROWN PRODUCT FOR   |

* |  USE IN LIFE-SUPPORT DEVICES AND/OR SYSTEMS.                           |

*  ------------------------------------------------------------------------ 

* |-------------------------------------------------------------|

* |  This macro model is being supplied as an aid to            |

* |  circuit designs.  While it reflects reasonably close       |

* |  similarity to the actual device in terms of performance,   |

* |  it is not suggested as a replacement for breadboarding.    |

* |  Simulation should be used as a forerunner or a supplement  |

* |  to traditional lab testing.                                |

* |                                                             |

* |  Neither this library nor any part may be copied without    |

* |  the express written consent of Burr-Brown Corporation.     |

* |                                                             |

* |  The users should carefully note the following factors      |

* |  regarding this model.                                      |

* |                                                             |

* |-------------------------------------------------------------|

*

* CONNECTIONS:   NON-INVERTING INPUT

*                |  INVERTING INPUT

*                |  |  POSITIVE POWER SUPPLY

*                |  |  |  NEGATIVE POWER SUPPLY

*                |  |  |  |  OUTPUT

*                |  |  |  |  |

.SUBCKT  OPA27M  3  2  7  4  6



* INPUT STAGE (pole @ 2M Hz)

Q1  13  2  15  N

Q2  14  11  16  N

R3  7  13  42.513

R4  7  14  42.513

C1  13  14  935.92E-12

R5  15  12  -9.187

R6  16  12  -9.187

IEE  12  4  1E-3

EOS  11  3  POLY(1)  (33,9)  25E-6  1

R1  2  10  5E11

R2  3  10  5E11

CIN  2  3  5E-12

IOS  2  3  35E-9



* GAIN STAGE (pole @ 4 Hz)

V21  7  21  1.8336

D21  23  21  DX

V22  22  4  1.8336

D22  22  23  DX

G21  7  23  POLY(1)  (13,14)   2.721E-3 17.41E-3

G22  4  23  POLY(1)  (13,14)  -2.721E-3 17.41E-3

R27  7  23  75.6E6

R28  4  23  75.6E6

C22  7  23  526.3E-12

C23  4  23  526.3E-12



* ZERO / POLE STAGE (zero @ 2.91M Hz, pole @ 10.91M Hz)

R46  41  43  1E6

R47  42  43  1E6

R45  7  41  2.75E6

R48  4  42  2.75E6

L41  7  41  14.589E-3

L42  4  42  14.589E-3

G45  7  43  23  9  1E-6

G46  4  43  23  9  1E-6



* ZERO / POLE STAGE (zero @ 2.91M Hz, pole @ 10.91M Hz)

R59  51  53  1E6

R50  52  53  1E6

R51  7  51  2.75E6

R52  4  52  2.75E6

L51  7  51  14.589E-3

L52  4  52  14.589E-3

G57  7  53  43  9  1E-6

G58  4  53  43  9  1E-6



* ZERO / POLE STAGE (zero @ 910k Hz, pole @ 6.37M Hz)

R69  61  63  1E6

R68  62  63  1E6

R61  7  61  6E6

R62  4  62  6E6

L61  7  61  25E-3

L62  4  62  25E-3

G67  7  63  53  9  1E-6

G68  4  63  53  9  1E-6



* COMMON-MODE REJECTION STAGE (zero @ 1k Hz)

R31  31  33  1E6

R32  32  33  1E6

G31  7  33  10  9  1.99526E-12

G32  4  33  10  9  1.99526E-12

L31  31  7  159.1549

L32  32  4  159.1549



* OUTPUT STAGE

D3  63  71  DX

D4  72  63  DX

D5  7  73  DX

D6  7  74  DX

D7  4  73  DZ

D8  4  74  DZ

G14  73  4  6  63  7.14286E-3

G13  74  4  63  6  7.14286E-3

V3  71  6  3.58686

V4  6  72  3.58686

G11  6  7  7  63  7.14286E-3

G12  4  6  63   4  7.14286E-3

R23  7  6  140

R24  4  6  140



* CENTER OF SUPPLIES

R9  7  9  16.359E3

R10  4  9  16.359E3



.MODEL  DX  D(IS=1E-15)

.MODEL  N  NPN(BF=12.5E3)

.MODEL  DZ  D(IS=1E-15 BV=50)



.ENDS
