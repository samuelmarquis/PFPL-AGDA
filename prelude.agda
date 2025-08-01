data ℕ : Set where
    Z : ℕ
    S : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ 
n + Z = n
n + (S m) = S (n + m)

infixl 5 _+_


{-# BUILTIN NATURAL ℕ #-}

data _===_ {T : Set} (x : T) : T → Set where
    refl : x === x

infixl 2 _===_



data ⊤ : Set where
    _ : ⊤

data ⊥ : Set where
    --

data Bool : Set where
    true : Bool
    false : Bool

NatEq : ℕ → ℕ → Bool
NatEq 0 0 = true
NatEq 0 (S n) = false
NatEq (S n) 0 = false
NatEq (S n) (S m) = NatEq n m

_❔_∴_ : {T : Set} → Bool → T → T → T
true ❔ x ∴ y = x
false ❔ x ∴ y = y

data List (T : Set) : Set where
    [] : List T
    _::_ : T → List T → List T 

infixr 4 _::_

_++_ : {T : Set} → List T → List T → List T
[] ++ x = x
(x :: xt) ++ y = x :: (xt ++ y)

data _∈_ : {T : Set} → T → List T → Set where
    x ∈ (y ∈ yt) 

{-# BUILTIN LIST List #-}


{-
test : ℕ → ℕ → ℕ
--test m n = n
test m n = m

test2 : (test 1 2) === 1 
test2 = refl

test3 : ℕ → ℕ
test4 : ℕ → ℕ
test3 x = test4 x
test4 y = test3 y

lol : ℕ → ℕ → ℕ

match : Bool → ℕ → ℕ → ℕ
match true x y = x
match false x y = y

lol x y = 
-}
