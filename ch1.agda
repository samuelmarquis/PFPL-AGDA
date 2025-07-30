open import prelude

data Exp : Set where
    num : ℕ → Exp
    var : String → Exp
    plus : Exp → Exp → Exp
    times : Exp → Exp → Exp

-- A[B/x] → A'
-- In A → Substitute with B → where x → producing A'
sub : Exp → Exp → String → Exp
sub (num n) B x = num n
sub (var y) B x = 
sub (plus A₁ A₂) B x = plus (sub A₁ B x) (sub A₂ B x)
sub (times A₁ A₂) B x = times (sub A₁ B x) (sub A₂ B x)

{-
free : Exp → List String
free (num n) = []
free (var x) = x ∷ []
free (plus a b) = (free a) ++ (free b)
free (times a b) = (free a) ++ (free b)

a : Exp
a = plus (num 5) (var "x") 

b : Exp
b = sub a (num 3) "x" 

_ : b ≡ sub a (num 3) "x"
_ =
  begin
    b
  ≡⟨⟩
    sub a (num 3) "x"
  ∎

_ : sub (var "x") (num 2) "x" ≡ num 2
_ =
  begin
    sub (var "x") (num 2) "x"
  ≡⟨⟩
    num 2
  ∎

nosub : ∀ (e : Exp) → sub (var "x") e "x" ≡ e 
nosub e =
  begin
    sub (var "x") e "x"
  ≡⟨⟩
    e
  ∎ 

--thm11 : (x : String) → ∀ (a : Exp) → x ∈ free(a) → ∀ (b : Exp) → x ∉ b → (c : Exp) → sub a b x ≡ c

data Abt : Set where
    num : ℕ → Abt
    var : String → Abt
    plus : Abt → Abt → Abt
    times : Abt → Abt → Abt
    letbe : Abt → String → Abt → Abt
-}
