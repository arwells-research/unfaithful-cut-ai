# The Unfaithful Cut: Why Some Intervention Failures Are Undetectable from Observation Alone
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18168366.svg)](https://doi.org/10.5281/zenodo.18168366)

**Author:** A. R. Wells  
**Affiliation:** Dual-Frame Research Group  
**License:** CC BY 4.0  
**Contact:** No solicitation for correspondence or media contact  
**Paper email:** arwells.research@proton.me  

---

## Overview

This repository contains the LaTeX source for the foundations paper  
**_The Unfaithful Cut: Why Some Intervention Failures Are Undetectable from Observation Alone_**.

The paper introduces a **diagnostic framework** for identifying when predictive
representations are **fundamentally incapable** of supporting reliable intervention or
control—even when observational prediction is perfect.

The central claim is **epistemic rather than algorithmic**:

> There exist representational reductions for which intervention behavior is
> fundamentally underdetermined by observational data alone.
> In such cases, no amount of additional data, training, or predictive accuracy
> can guarantee reliable control without acting on the system itself.

This representational failure mode is formalized as the **unfaithful cut**.

---

## The Unfaithful Cut (Core Idea)

A predictive model operates through an **interface** that defines what it can observe,
store, and condition on. This interface induces a many-to-one reduction from underlying
system trajectories to representational states.

An **unfaithful cut** occurs when:

- the reduction is **closed under prediction**  
  (observational evaluation cannot distinguish collapsed histories), but
- not **closed under intervention**  
  (admissible actions separate those histories in deployment).

In such cases, the model’s representation is **observationally adequate** but
**interventionally insufficient**.

Crucially, this failure:

- is **structural**, not statistical  
- is **independent of optimization or model capacity**  
- remains invisible under passive observational evaluation  
- cannot be repaired by more data alone  

---

## Relation to Causal Inference and RL

From a causal inference perspective, unfaithful cuts correspond to **causal
insufficiency**: the variables exposed at the model interface are insufficient to
determine intervention outcomes.

The contribution of this work is **not** to identify a failure mode beyond causal
insufficiency, but to make explicit:

- how such insufficiency arises from **representational interface choices**, and
- why it persists in **learned systems** (e.g., reinforcement learning, control,
  sim-to-real transfer) where causal structure is implicit, underspecified, or
  impractical to enumerate.

Unlike state aliasing analyses in reinforcement learning—which are typically defined
relative to value preservation or policy optimality—the unfaithful cut is defined purely
at the level of **representational distinguishability under admissible interventions**,
independent of rewards, objectives, or learning algorithms.

---

## What This Paper Demonstrates

The paper establishes three core results:

1. **Epistemic limitation of observational evaluation**  
   There exist intervention failures that are **provably undetectable** from
   observational data alone, even with perfect prediction over the interface variables.

2. **Representational origin of intervention failure**  
   These failures arise from how histories are collapsed at the model interface, not
   from estimation error, data scarcity, or incorrect learning objectives.

3. **A domain-agnostic diagnostic criterion**  
   The unfaithful cut provides a structural test for when a predictive representation
   cannot, in principle, support reliable intervention—prior to deployment.

The diagnostic applies across:
- sim-to-real robotics
- offline reinforcement learning
- control systems
- causal modeling and decision support

---

## What This Paper Does *Not* Claim

- It does **not** propose a new learning algorithm  
- It does **not** replace causal inference or RL theory  
- It does **not** guarantee tractable detection in general systems  
- It does **not** claim empirical scalability as a result  

Instead, it formalizes a **limit**: when a representation collapses intervention-relevant
distinctions, no purely observational procedure can certify its reliability for control.

---

## Repository Contents

- `unfaithful_cut.tex` — master LaTeX source  
- `sections/` — main paper sections  
- `appendices/` — worked examples and technical details  
- `bib/references.bib` — bibliography  
- `figures/` — figures and diagrams  

Key appendices:

- **Appendix A** — minimal toy example illustrating epistemic undetectability  
- **Appendix B** — tractable special case (finite deterministic systems)  
- **Appendix C** — minimal offline RL–style illustration highlighting stochastic separation  

---

## Build Instructions

**Requirements:** `latexmk` with a standard LaTeX installation.

Build the PDF:

    latexmk -pdf -interaction=nonstopmode -halt-on-error unfaithful_cut.tex

Clean build artifacts:

    latexmk -C

---

## Status

- Epistemic framing finalized  
- Formal definitions complete  
- Internal consistency with causal inference clarified  
- Illustrative examples included  
- Scope and limitations explicitly acknowledged  

**Release:** Published on Zenodo (versioned)

- **Version v1 DOI:** https://doi.org/10.5281/zenodo.18181967
- **All versions DOI:** https://doi.org/10.5281/zenodo.18181966

---

## Citation

If you use or reference this work, please cite the Zenodo record corresponding to the
version used.

**Recommended citation (v1):**

A. R. Wells (2026).  
*The Unfaithful Cut: Why Some Intervention Failures Are Undetectable from Observation Alone* (v1).  
Zenodo. https://doi.org/10.5281/zenodo.18181967 

For citation independent of version, use the **all-versions DOI**:  
https://doi.org/10.5281/zenodo.18181966

This work is released under **Creative Commons Attribution 4.0 (CC BY 4.0)**.