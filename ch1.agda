open import prelude

data Exp : Set where
    num : ℕ → Exp
    var : ℕ → Exp
    plus : Exp → Exp → Exp
    times : Exp → Exp → Exp

-- A[B/x] → A'
-- In A → Substitute with B → where x → producing A'
sub : Exp → Exp → ℕ → Exp
sub (num n) B x = num n
sub (var y) B x = (NatEq x y) ❔ B ∴ (var y) 
sub (plus A₁ A₂) B x = plus (sub A₁ B x) (sub A₂ B x)
sub (times A₁ A₂) B x = times (sub A₁ B x) (sub A₂ B x)

a : Exp
a = plus (num 5) (var 0) 

b : Exp
b = sub a (num 3) 0

_ : b === (plus (num 5) (num 3)) 
_ = refl

free : Exp → List ℕ
free (num n) = []
free (var x) = x :: []
free (plus a b) = (free a) ++ (free b)
free (times a b) = (free a) ++ (free b)


nosub : ∀ (e : Exp) → sub (var 0) e 0 === e 
nosub e = refl

thm11 : (x : ℕ) → (a : Exp) → x ∈ free(a) → (b : Exp) → x ∉ b → ∃ (c : Exp) → sub a b x === c

data Abt : Set where
    num : ℕ → Abt
    var : ℕ → Abt
    plus : Abt → Abt → Abt
    times : Abt → Abt → Abt
    letbe : Abt → ℕ → Abt → Abt
