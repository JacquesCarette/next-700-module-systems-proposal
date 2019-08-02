{- (load-file "PackageFormer.el") -}

{-
0. There are a number of common use-cases.
1. We can handle all of them & more, since we're extensible.
  - Mention the Lean & Coq, as well as the Agda, repeated fragments.
2. The resulting setup is pragmatic: It is unobtrusive in the
   traditional Agda coding style in that it happens in the background.
3. It fills a particular need; the desire to avoid repetitious code.
-}

module Testing where
open import Testing_Generated

open import Level
open import Data.Bool
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.String hiding (_++_)

{-700

-- The next two lines are not 700-syntax and so are ported over to the generated file.
variable
   ℓ : Level

PackageFormer MonoidP : Set₁ where
    Carrier : Set
    _⨾_     : Carrier → Carrier → Carrier
    Id      : Carrier
    assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)
    leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x
    rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x

PackageFormer M-Set : Set₁ where
   Scalar  : Set
   Vector  : Set
   _·_     : Scalar → Vector → Vector
   𝟙       : Scalar
   _×_     : Scalar → Scalar → Scalar
   leftId  : {𝓋 : Vector}  →  𝟙 · 𝓋  ≡  𝓋
   assoc   : {a b : Scalar} {𝓋 : Vector} → (a × b) · 𝓋  ≡  a · (b · 𝓋)

-- Gives error that 𝒱-doit is not defined (งಠ_ಠ)ง
-- Whoops   =  MonoidP doit

-}

{- Find definition with M-. on the “_ = ⋯” lines to see the generated code -}

{-700
-- Variational with empty right hand side.
𝒱-identity =
MonoidPⁱᵈ = MonoidP identity

-- No variational clauses needed!
MonoidP⁰  = MonoidP

-- Identity of composition ⟴
MonoidPᶜ = MonoidP ⟴

-- Operationally: Pf ⟴ v  ≈  Pf v ⟴  ≈  Pf v

-- “⟴” is just forwards composition: We ‘thread’ the Pf through the compositions vᵢ in order.

-}

{-700
-- 𝒱-whoops              = :type recorder :waist-strings '("field")

𝒱-record                 = :type record :waist-strings '("field")
𝒱-typeclass-attempt      = :type record :waist-strings '("field") :waist 2
𝒱-typeclass₂             = :type record :waist-strings '("field") :waist 2 :level dec
𝒱-typeclass height level = record ⟴ :waist height :level level

MonoidT₃   =  MonoidP record ⟴ :waist 3 :level dec
MonoidT₂   =  MonoidP typeclass₂
MonoidT₄   =  MonoidP typeclass :height 4 :level 'dec

M-Set-Record = M-Set record
M-Set-Typeclass₃ = M-Set-Record typeclass :height 3 :level 'dec
-}

_ = MonoidT₃
_ = MonoidT₂
_ = MonoidT₄
_ = M-Set-Record
_ = M-Set-Typeclass₃


{-700

-- First one is intensionally erroenous attempt.
𝒱-primed-attempt = :alter-elements (lambda (fs) (mapcar (lambda (f) (map-name (concat name "′") f)) fs))

𝒱-primedₗₑₜ = :alter-elements (lambda (fs) (-as-> (-unzip (--zip-with `(,other  ,(format "let %s = %s in " (get-name it) (get-name other))) fs (--map (map-name (concat name "′") it) fs))) yup (--zip-with (map-type (concat (s-join "" it) type) other) (-inits (cadr yup)) (car yup))))

M-Set′-attempt = M-Set primed-attempt

MonoidR    =  MonoidP record
MonoidR′   =  MonoidP record ⟴ primedₗₑₜ
MonoidR″   =  MonoidR primedₗₑₜ

-- Operationally: Pf v₀ ⟴ ⋯ ⟴ vₙ ≈ ((Pf v₀) v₁) ⋯) vₙ
-- Note: In the concrete syntax, such parenthisation is not permitted.
-}

_ = MonoidR
_ = MonoidR′
_ = MonoidR″

{-700
𝒱-map elements = :alter-elements (lambda (fs) (-as-> (-unzip (--zip-with `(,other  ,(format "let %s = %s in " (get-name it) (get-name other))) fs (mapcar elements fs))) yup (--zip-with (map-type (concat (s-join "" it) type) other) (-inits (cadr yup)) (car yup))))

Monoidₘ = MonoidR map :elements (lambda (f) (make-tn (concat (get-name f) "ₘ") (get-type f)))

-- Note the prime on the rhs. MA: Maybe avoid this?
𝒱-rename₀ elements = map :elements 'elements

𝒱-rename elements = map :elements (lambda (f) (make-tn (rename-mixfix elements (get-name f)) (get-type f)))

Monoidₙ = MonoidR rename :elements (lambda (name) (concat name "ₙ"))
-}

_ = Monoidₘ   -- Notice the name is “_⨾_ₘ”
_ = Monoidₙ   -- Notice the name is “_⨾ₙ_”
              -- The differences are due to the choice of renaming scheme above.

{-700

𝒱-data carrier = :type data :level dec :alter-elements (lambda (fs) (thread-last fs (--filter (s-contains? carrier (target (get-type it)))) (--map (map-type (s-replace carrier $𝑛𝑎𝑚𝑒 type) it)) ))

-- MonoidD₁ = MonoidP data :carrier "Carrier"
-}
-- _ = MonoidD₁



------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Experiments follow --




-- Let's generalise one of the core ideas from this venture.
-- First, a type with multiple sorts to use for examples.
{-700


-- The name “_×_” is in scope since I've imported Data.Product down below for some
-- experimentation, so using a primed variant “_×′_” ^_^
-- M-Set-R = M-Set record ⟴ primed

-}
-- _ = M-Set-R

-- First, we filtered out elements and so this may become a variational.

{- 00
-- Useful
-- 𝒱-keepingC = record ⟴ :alter-elements (lambda (fs) (thread-last fs (--filter (or (equal "Carrier" (get-name it)) (s-contains? "Carrier" (target (get-type it)))))))

-- cute, but too brutish.
𝒱-keeping those = :alter-elements (lambda (fs) (thread-last fs (-filter those)))
-- instead:
-- 𝒱-keeping those = generated :by 'those
--
-- Passed functions need the quote.
--
-- Not ideal due to the let-in clauses.

-- 𝒱-keepingC = record ⟴ :alter-elements (lambda (fs) (thread-last fs (--map (or (equal "_⨾_" (get-name it)) (s-contains? "_⨾_" (target (get-type it))))) (--map (format "%s" it))))
-}

-- Here's some nifty applications!

{-00
-- Second not ideal due to the let-in clauses.
--
𝒱-sorts = keeping :those (lambda (f) (s-contains? "Set" (target (get-type f))))
-- 𝒱-sorts = generated :by (lambda (f) (s-contains? "Set" (target (get-type f))))

M-Set-Sorts = M-Set-R sorts
-}
-- _ = M-Set-Sorts

{-
-- 𝒱-data-with-identified carrier = :type data :level dec :alter-elements (lambda (fs) (thread-last fs (--filter (-any? (lambda (c) (s-contains? c (target (get-type it)))) carrier)) (loop for c in carrier do (--map (map-type (s-replace c $𝑛𝑎𝑚𝑒 type) it)) )))

𝒱-data-with-identified carrier = :alter-functions (lambda (f) (message-box "HELLO"))

M-Set′ = M-Set record ⟴ primed

M-Set-Syntax = M-Set′ data-with-identified :carrier (list '(list "Scalar"))
-}


{-00

𝒱-data-with carrier      = map :elements (lambda (f) (when (s-contains? carrier (target (get-type f))) (map-type (s-replace carrier $𝑛𝑎𝑚𝑒 type) f)))

MonoidD   =  MonoidP data-with :carrier "Carrier"

-}

{- TODO
PackageFormer MonoidP : Set₁ where
    Carrier : Set
    _⨾_     : Carrier → Carrier → Carrier
    Id      : Carrier

    left-⨾  : Carrier → Carrier → Carrier → Carrier
    left-⨾ x y z = (x ⨾ y) ⨾ z

    assoc   : ∀ {x y z} → left-⨾ x y z ≡ x ⨾ (y ⨾ z)
    leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x
    rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x

- record ⇒ local intersped with fields
- data  ⇒ rewrite [syntax sugar] and possibly global operation afterwards as an additional new method, and possibly adding it in as a constructor to the data-type, eg. See Isabelle's distinctions of definition vs abbrevation where the former rewuires an explicit tactic to apply as in coq's intro and the latter is definitional.
- module ⇒ local let, or possibly rewrite with local declaration inside module

-- MonoidR   =  MonoidP :type record :waist 2 :level dec ⟴ :waist-strings '("private" "n : Set₁" "n = Set" "field")
-- MonoidD = data-with :carrier Carrier
-}


{- TODO:

𝒱-record⁷             = :type record :waist-strings (when (package-former-elements self) '("field"))

-- TODO: alter-elements needs to actually be a function on the elements list; we currently have :map-elements!
--

𝒱-data-with carrier      = :type data :level dec :alter-elements (lambda (f) (if (s-contains? carrier (target (get-type f))) (map-type (s-replace carrier $𝑛𝑎𝑚𝑒 type) f) ""))

-}

{-
(insert (pp-to-string package-formers))



(("Monoidₙ" . #s(package-former "Monoidₙ = MonoidR rename :elements (lambda (name) (concat name \"ₙ\"))" "record" "Monoidₙ" "₁" 0
                                ("field")
                                4 nil))
 ("Monoidₘ" . #s(package-former "Monoidₘ = MonoidR map :elements (lambda (f) (make-tn (concat (get-name f) \"ₘ\") (get-type f)))" "record" "Monoidₘ" "₁" 0
                                ("field")
                                4 nil))
 ("MonoidR″" . #s(package-former "MonoidR″   =  MonoidR primed" "record" "MonoidR″" "₁" 0
                                 ("field")
                                 4 nil))
 ("MonoidR′" . #s(package-former "MonoidR′   =  MonoidP record ⟴ primed" "record" "MonoidR′" "₁" 0
                                 ("field")
                                 4 nil))
 ("MonoidR" . #s(package-former "MonoidR    =  MonoidP record" "record" "MonoidR" "₁" 0
                                ("field")
                                4
                                ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidT₄" . #s(package-former "MonoidT₄   =  MonoidP typeclass :height 4 :level 'dec" "record" "MonoidT₄" "" 4
                                 ("field")
                                 4
                                 ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidT₂" . #s(package-former "MonoidT₂   =  MonoidP typeclass₂" "record" "MonoidT₂" "" 2
                                 ("field")
                                 4
                                 ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidT₃" . #s(package-former "MonoidT₃   =  MonoidP record ⟴ :waist 3 :level dec" "record" "MonoidT₃" "" 3
                                 ("field")
                                 4
                                 ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidP⁰" . #s(package-former "MonoidP⁰  = MonoidP" "PackageFormer" "MonoidP⁰" "₁" 0 nil 4
                                 ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidPⁱᵈ" . #s(package-former "MonoidPⁱᵈ = MonoidP identity" "PackageFormer" "MonoidPⁱᵈ" "₁" 0 nil 4
                                  ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x")))
 ("MonoidP" . #s(package-former nil "PackageFormer" "MonoidP" "₁" 0 nil 4
                                ("Carrier : Set" "_⨾_     : Carrier → Carrier → Carrier" "Id      : Carrier" "assoc   : ∀ {x y z} → (x ⨾ y) ⨾ z ≡ x ⨾ (y ⨾ z)" "leftId  : ∀ {x : Carrier} → Id ⨾ x ≡ x" "rightId : ∀ {x : Carrier} → x ⨾ Id ≡ x"))))


-}

{-00


𝒱-filter-attempt by = map :elements (lambda (f) (if (funcall by f) f ""))
MonoidF   = MonoidP filter :by (lambda (f) nil)


--

-- TODO: 7 crashes things --yikes! This is because agda keyword field cannot occur barren --c.f. 𝓥-record⁷.
-- MonoidT⁷ = MonoidP record ⟴ :waist 4

-}






















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
{- TODO: Eventually; after prototype is done.











open import Function using (id)
open import Data.List using (List; map)
open import Data.String using () renaming (String to Name)
open import Data.String using () renaming (String to Type)
-- open import Data.Product using (_×_) renaming (map to bimap)


{- TODO: Eventually; after prototype is done. -}
data VarExpr : Set where
  :kind : String → VarExpr
  :alter-elements : String → VarExpr


{- No lambda's allowed; all arguments must be to the left of the ‘=’. -}
{- Definition must be one liner. -}
𝑽-adorn : List (Name × Type) → (Name → Name) → List (Name × Type)
𝑽-adorn xs f = map (bimap f id) xs

import Data.Maybe as Maybe
open Maybe using (Maybe; just; nothing)
import Data.List as List
open import Data.List using (_++_ ; _∷_)
data Kind : Set where
  ‵data ‵record ‵module ‵function ‵packageformer : Kind
  --
  -- note that pf's are not necessary, we can work with records then
  -- reify them as other groupingmechanisms.
  -- BUT it's preferable to be as unbiased as possible
  -- hence we keep the generic package-former kind.

record PF : Set where
  field
    kind       : Kind
    name       : Name
    level      : Level
    {- The following four are the “constiutents” or “elements” of a PackageFormer -}

    -- old, remove me
    variation  : Maybe Name
    carrier    : Maybe Name

    parameters : List (Name × Type)
    fields     : List (Name × Type)

{-
pf′ = pf variational (args; otherwise)

variational : (new-name : Name) (args : ⋯) (otherwise : ? → ?) → PF
variational pf′ args otherwise = ???
-}

_Variational₁ : {ℓ : Level} (X : Set ℓ) → Set ℓ
X Variational₁ = (new-name : Name) (to-list : List (Name × X)) (otherwise : Name → X)
               → PF → PF

_Variational₀ : {ℓ : Level} (X : Set ℓ) → Set ℓ
X Variational₀ = (new-name : Name) (to-list : List X) (otherwise : Name → X)
               → PF → PF

open import Data.Product using (_,_)
open import Data.String using (String)
postulate string-replace : (old new : String) → String → String

𝑽-record : Name Variational₁
𝑽-record new-name to-list otherwise pf = let open PF pf in
  record
    { kind       = ‵record
    ; name       = new-name
    ; variation  = nothing
    ; level      = Level.suc level
    ; carrier    = just "Carrier"
    ; parameters = List.[]
    ; fields     =    parameters
                   ++ ("Carrier" , "Set level")  -- HACK!
                   ∷ List.map (bimap (string-replace "name variation" "Carrier") id) fields   -- HACK!
    }

{- This’ a lot at once; let's instead focus on small combinators. -}

-- as-kind : Kind → PF → PF
-- as-kind k

{-
with-carrier : Name → PF → PF
with-carrier c pf = let open PF pf in
  record
    { kind       = kind
    ; name       = name
    ; level      = level
    ; variation  = variation
    ; carrier    = just c
    ; parameters = List.map (bimap f id) parameters
    ; fields     = List.map (bimap f id) fields
    }


alter-elements : (Name → Name) → PF → PF
alter-elements f pf = let open PF pf in
  record
    { kind       = kind
    ; name       = name
    ; level      = level
    ; variation  = variation
    ; carrier    = Maybe.map f carrier
    ; parameters = List.map (bimap f id) parameters
    ; fields     = List.map (bimap f id) fields
    }

-}

{-00

Woah = Monoid record adorn (λ x → x ++ "ₐ")

-}




-- Since seven-hundred comments generate code which is imported, we may use their results
-- seemingly before their definition

-- _ = MonoidR
-- open MonoidR′

{-00
MonoidR   = Monoid record
MonoidR′  = Monoid opening MonoidR (λ x → x ++ "′")
MonoidR₁  = Monoid opening MonoidR (λ x → x ++ "₁")
MonoidR₂  = Monoid opening MonoidR (λ x → x ++ "₂")


record Monoid-Hom (𝒮 𝒯 : MonoidR) : Set where
  open MonoidR₁ 𝒮; open MonoidR₂ 𝒯
  field
    mor     : Carrier₁ → Carrier₂
    id-pres : mor Id₁ ≡ Id₂
    op-pres : ∀ {x y} → mor (x ⨾₁ y) ≡ mor x ⨾₂ mor y
-}

{- Below are other examples, from the past. -}

{-00
MonoidTypeclass = Monoid typeclass hiding (_⨾_)
MonoidT         = Monoid typeclass renaming (Carrier to C; _⨾_ to _⊕_)
MonoidE         = Monoid record exposing (Carrier; Id)
MonoidB         = Monoid record with (Carrier to Bool; Id to false)
MonoidD         = Monoid data renaming (_⨾_ to _Δ_)


-- MonoidR         = Monoid record unbundling 2
-- MonoidD′        = Monoid data decorated (λ it → "╲" ++ it ++ "╱")

-- Accidentally “datar” instead of “data”.
-- Whoops = Monoid datar

_ = MonoidTypeclass
{- record MonoidTypeclass (Carrier : Set) : Set where … -}

_ = MonoidT ; open MonoidT using (_⊕_)
{- record MonoidT (C : Set) : Set where … -}

_ = MonoidR
{- record MonoidR (Carrier : Set) (_⨾_ : Carrier → Carrier → Carrier) : Set where … -}

_ = MonoidD
{- data MonoidD : Set where … -}

_ = MonoidE
{- record MonoidE (Carrier : Set) (Id : Carrier) : Set where … -}

_ = MonoidB ; open MonoidB using (leftfalse)
{- record MonoidB : Set₀ where … -}

-- _ = MonoidD′

-}

-}
