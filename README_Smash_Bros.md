
# Smash Bros Character Analysis 🎮📊

### Overview
This project explores Super Smash Bros Ultimate character performance through a mix of player outcomes and character stat data. Using R for regression and analysis, I aimed to investigate which in-game factors might influence wins in competitive matches.

This was completed as an **independent study research project** in collaboration with a faculty advisor and presented in 2024 at the **PCAACA National Conference**.

---

### 🎯 Objective
To examine relationships between character attributes (for ex. speed, weight, fall rate) and competitive performance in matches across various characters and stages. This was done in order to identify which stats may correlate with higher win rates.

---

### 🧠 Methods
- **Tooling:** R, Excel, ggplot2, dplyr
- **Data Sources:**
  - Character-level stats (movement, gravity, weight, frame data)
  - Match-level outcomes (players, characters used, game/stage, stocks, kills)
- **Data Cleaning:** Performed in Excel (see `Full Data` sheet)
- **Modeling Approach:**
  - Binary logistic regression on win/loss outcome
  - Visualizations of key stat distributions

---

### 🔍 Key Insights
- Certain mobility metrics (for ex. **walk speed**, **air speed**, and **gravity**) showed significant influence on outcome probability.
- Characters with **higher jump heights and fall speeds** trended towards a higher likelihood of wins. 
- The dataset showed **potential nonlinear relationships** between attributes like weight and success. This signifies the need for future research and affirmation of the data.

---

### 📉 Sample Visualization



---

### 📁 Files
| File Name | Description |
|-----------|-------------|
| `Smash_Data.xlsx` | Cleaned dataset with merged match and character stats |
| `smash_model_code.R` | R script for cleaning, modeling, and visualization |

---

### ⚠️ Limitations
- Dataset size was limited (~700 matches) and lacked some contextual factors like player skill level, controller type, or matchup familiarity.
- Model assumptions (e.g., independence, linearity) may not fully hold given game complexity.
- Rounding and missing data required some imputation and filtering decisions.

---

### 🔮 Future Work
- Expand dataset to include **tournament placement**, **set count**, and **matchup history**.
- Explore **nonlinear models** (for ex. decision trees, interaction terms) or **mixed-effects models** for player-level variance.
- Add additional context like **stage counter-picking** or **character buffs/patches**.

---

### 🧵 Fun Fact
Did you know some high-tier characters like **Joker** have deceptively average stats but consistently high results? This suggests **player familiarity** and **meta advantage** might matter just as much as raw numbers.

---

### 🧑‍💻 Author
**Sonia Ahmaripour** — Math graduate + Data Analyst in training, passionate about esports, games research, and statistical storytelling.

---

### 🗣️ How to Cite
Please credit this repository or my name if referencing in academic or creative work! All match data was manually reviewed and processed.
