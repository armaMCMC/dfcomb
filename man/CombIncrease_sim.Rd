\name{CombIncrease_sim}
\alias{CombIncrease_sim}
\alias{print.CombIncrease_sim}
\title{Combination design Simulator using Logistic model}
\description{
\code{CombIncrease_sim} is used to generate simulation replicates of phase I clinical trial for combination studies where the toxicity and efficacy of both agents is assumed to increase with the dose using the design proposed by Riviere et al. entitled "A Bayesian dose-finding design for drug combination clinical trials based on the logistic model".
}
\usage{
CombIncrease_sim(ndose_a1, ndose_a2, p_tox, target, target_min, target_max, 
prior_tox_a1, prior_tox_a2, n_cohort, cohort, tite=FALSE, time_full=0, 
poisson_rate=0, nsim, c_e=0.85, c_d=0.45, c_stop=0.95, n_min=6, seed = 14061991)
}
\arguments{
  \item{ndose_a1}{Number of dose levels for agent 1.}
  \item{ndose_a2}{Number of dose levels for agent 2.}
  \item{p_tox}{A matrix of the true toxicity probabilities associated with the combinations. True toxicity probabilities should be entered with agent 1 in row and agent 2 in column, with increasing toxicity probabilities with both row and column numbers (see examples).}
  \item{target}{Toxicity (probability) target (for dose allocation).}
  \item{target_min}{Minimum of the targeted toxicity interval (for dose recommendation).}
  \item{target_max}{Maximum of the targeted toxicity interval (for dose recommendation).}
  \item{prior_tox_a1}{A vector of initial guesses of toxicity probabilities associated with the doses of agent 1. Must be of length \code{ndose_a1}.}
  \item{prior_tox_a2}{A vector of initial guesses of toxicity probabilities associated with the doses of agent 2. Must be of length \code{ndose_a2}.}
  \item{n_cohort}{Total number of cohorts to include in the trial.}
  \item{cohort}{Cohort size.}
  \item{tite}{A boolean indicating if the toxicity is considered as a time-to-event outcome (TRUE), or as a binary outcome (default value FALSE).}
  \item{time_full}{Full follow-up time window. This argument is used only if tite=TRUE.}
  \item{poisson_rate}{A value indicating the rate for the Poisson process used to simulate patient arrival, i.e. expected number of arrivals per observation window. This argument is used only if tite=TRUE.}
  \item{nsim}{Number of simulations.}
  \item{c_e}{Probability threshold for dose-escalation. The default value is set at 0.85.}
  \item{c_d}{Probability threshold for dose-deescalation. The default value is set at 0.45.}  
  \item{c_stop}{Probability threshold for early trial termination. The default value is set at 0.95.}
  \item{n_min}{Minimum number of patients to be included before possible early trial termination. The default value is set at 6.}
  \item{seed}{Seed of the random number generator. Default value is set at 14061991.}}
\value{
An object of class "CombIncrease_sim" is returned, consisting of the operating characteristics of the design specified. Objects generated by \code{CombIncrease_sim} contain at least the following components: 
\item{p_tox}{True toxicity probabilities.}
\item{rec_dose}{Percentage of combination selection.}
\item{n_pat_dose}{Mean number of patients at each combination.}
\item{n_tox_dose}{Mean number of toxicities at each combination.}
\item{inconc}{Percentage of inclusive trials.}
\item{n_min}{Minimum number of cohorts to stop the trial.}
\item{nsim}{Number of simulations (if function stopped while executed, return the current number of simulations performed with associated other outputs).}
\item{cohort}{Cohort size.}
\item{n_cohort}{Number of cohort planned.}
\item{pat_tot}{Total mean number of patients accrued.}
\item{target}{Toxicity target.}
\item{[target_min, target_max]}{Targeted toxicity interval.}
\item{prior_tox_a1}{Prior toxicity probabilities for agent 1.}
\item{prior_tox_a2}{Prior toxicity probabilities for agent 2.}
\item{c_e}{Escalation threshold.}
\item{c_d}{Deescalation threshold.}
\item{c_stop}{Stopping threshold.}
\item{tite}{Type of outcome for toxicity (time-to-event or binary).}
\item{time_full}{If toxicity is a time-to-event, full follow-up time is also reminded.}
\item{poisson_rate}{If toxicity is a time-to-event, rate for Poisson process is also reminded.}
}
\references{
Riviere, M-K., Yuan, Y., Dubois, F., and Zohar, S. (2014). A Bayesian dose-finding design for drug combination clinical trials based on the logistic model. Pharmaceutical Statistics.
}
\author{Jacques-Henri Jourdan and Marie-Karelle Riviere-Jourdan \email{eldamjh@gmail.com}}
\seealso{
  \code{\link{CombIncrease_next}}.
}
\examples{
p_tox_sc1 = matrix(c(0.05,0.10,0.15,0.30,0.45,
                     0.10,0.15,0.30,0.45,0.55,
                     0.15,0.30,0.45,0.50,0.60),nrow=5,ncol=3)
p_tox_sc6 = matrix(c(0.05,0.08,0.10,0.13,0.15,
                     0.09,0.12,0.15,0.30,0.45,
                     0.15,0.30,0.45,0.50,0.60),nrow=5,ncol=3)
prior_a1 = c(0.12, 0.2, 0.3, 0.4, 0.5)
prior_a2 = c(0.2, 0.3, 0.4)

# UNCOMMENT THOSE EXAMPLES
#sim1 = CombIncrease_sim(ndose_a1=5, ndose_a2=3, p_tox=p_tox_sc1, target=0.30, 
#target_min=0.20, target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2, 
#n_cohort=20, cohort=3, tite=FALSE, nsim=2, c_e=0.85, c_d=0.45, c_stop=0.95, 
#n_min=4, seed = 14061991)
                        
#sim1
                        
#sim2 = CombIncrease_sim(ndose_a1=5, ndose_a2=3, p_tox=p_tox_sc6, target=0.30, 
#target_min=0.20, target_max=0.40, prior_tox_a1=prior_a1, prior_tox_a2=prior_a2, 
#n_cohort=20, cohort=3, nsim=2)  

#sim2

# Dummy example, running quickly
useless = CombIncrease_sim(ndose_a1=3, ndose_a2=2,
  p_tox=matrix(c(0.05,0.15,0.30,0.15,0.30,0.45),nrow=3), target=0.30,
  target_min=0.20, target_max=0.40, prior_tox_a1=c(0.2,0.3,0.4),
  prior_tox_a2=c(0.2,0.3), n_cohort=2, cohort=2, nsim=1)
}
