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


BBeq' : Bool → Bool → Bool
BBeq' true true = true
BBeq' true false = false
BBeq' false true = false
BBeq' false false = true

record Beq {T : Set} : Set where
    field
        _==_ : T → T → Bool

instance
    BoolBeq 
    _==_ {{BoolBeq}}

data List (T : Set) : Set where
    [] : List T
    _::_ : T → List T → List T 

infixr 4 _::_

{-# BUILTIN LIST List #-}

postulate Char : Set
{-# BUILTIN CHAR Char #-}

postulate String : Set
{-# BUILTIN STRING String #-}
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
