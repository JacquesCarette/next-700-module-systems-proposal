<h1> The Next 700 Module Systems </h1>

<h3> Extending Dependently-Typed Languages to Implement Module System Features In The Core Language </h3>

This repository contains the research proposal for my doctoral studies at McMaster University
under the supervision of Jacques Carette and Wolfram Kahl.

*What are and what should be the module systems of DTLs?*
*DTLs remove distinctions between packaging systems and so*
*using pedestrian modules systems is not necessarily the best route.*

-   A requirements driven approach to coherent modularisarion constructs in Dependently-typed languages.
-   Main Question: *What are the module systems for Dependently-Typed Languages?*
-   Goal: Extend Agda to be powerful enough to implement the module system features, in the core language, that people want to do.
    
    In user facing libraries, [redundancies are desirable](https://inf.ug.edu.pl/~schwarzw/papers/mkm2010.pdf)
    since they may utilise a a variety of aliases for what user want, this is useful
    flexibility.
    
    -   However, in the source file, each item should only exist once.
    -   The front-end redundancy should be produced by machine generation,
        rather than by hand.

<div class="org-center">
  [Website](https://alhassy.github.io/next-700-module-systems-proposal/)
◈ [PDF](https://alhassy.github.io/next-700-module-systems-proposal/thesis-proposal.pdf) 
◈ [Slides](https://alhassåy.github.io/next-700-module-systems-proposal/defence-slides.html) 
◈ [`translate` code](https://alhassy.github.io/next-700-module-systems-proposal/translate_functions.agda) 
◈ [`monoid` code](https://alhassy.github.io/next-700-module-systems-proposal/monoid_renditions.agda) 

( For the slides, you may need to “allow unsafe scripts”. )    
</div>
