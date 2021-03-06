(**********************************************************************)
(* Equations                                                          *)
(* Copyright (c) 2009-2016 Matthieu Sozeau <matthieu.sozeau@inria.fr> *)
(**********************************************************************)
(* This file is distributed under the terms of the                    *)
(* GNU Lesser General Public License Version 2.1                      *)
(**********************************************************************)

open Constr
open Environ
open Names
open EConstr

val mk_term_eq :
  env ->
  Evd.evar_map ref ->
  constr ->
  constr -> constr -> constr -> constr * constr
val make_abstract_generalize :
  Proof_type.goal Evd.sigma ->
  Evd.evar_map ref ->
  Id.t ->
  constr ->
  bool ->
  rel_context ->
  constr option ->
  constr ->
  constr list -> constr list -> constr list -> constr
val hyps_of_vars :
  env -> Evd.evar_map ->
  named_context ->
  Id.Set.t -> Id.Set.t -> Id.Set.elt list
exception Seen
val linear : Evd.evar_map -> Id.Set.t -> constr array -> bool
val needs_generalization :
  Proof_type.goal Evd.sigma -> Id.t -> bool
val abstract_args :
  Proof_type.goal Evd.sigma ->
  bool ->
  bool ->
  Id.Set.elt ->
  bool ->
  constr ->
  constr array ->
  (constr * bool * int * Id.Set.elt list) option
val abstract_generalize :
  ?generalize_vars:bool ->
  ?force_dep:bool ->
  Id.Set.elt ->
  Proof_type.goal Evd.sigma -> Proof_type.goal list Evd.sigma
val dependent_pattern :
  ?pattern_term:bool ->
  constr -> Proof_type.goal Evd.sigma -> Evar.t list Evd.sigma


val depcase : Decl_kinds.polymorphic ->
  MutInd.t * int ->
  Environ.env * Evd.evar_map * rel_context * constr * Globnames.global_reference
val derive_dep_elimination :
  Environ.env -> Evd.evar_map -> polymorphic:Decl_kinds.polymorphic -> pinductive -> constr


val pattern_call :
  ?pattern_term:bool ->
  constr -> Proof_type.goal Evd.sigma -> Evar.t list Evd.sigma

val specialize_eqs : Names.Id.t -> Proof_type.tactic

val compare_upto_variables : Evd.evar_map -> constr -> constr -> bool

val dependent_elim_tac : ?patterns:Syntax.user_pat_expr list -> Names.Id.t Syntax.with_loc ->
  unit Proofview.tactic
