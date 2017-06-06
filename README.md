# Gender-Recognition-by-Voice

This project trains a computer program to identify a voice as male or female, based upon acoustic properties of the voice and speech. The model is trained on a dataset consisting of 3,168 recorded voice samples, collected from male and female speakers. The voice samples are pre-processed by acoustic analysis in R and then processed with artificial intelligence/machine learning algorithms to learn gender-specific traits for classifying the voice as male or female.

It has built an ensemble model that provides improved results over the given data up to 98.5 % to determine the gender of a person by using his or her voice data.



Dataset

The pre-processed dataset was saved into a CSV file,containing 3168 instances and 21 columns (20 columns for each attribute and one
label column for the classification of male or female).

The following acoustic properties ofeach voice are measured and included within the CSV:

 meanfreq:
     mean frequency (in kHz)
 sd:
     standard deviation of frequency
 median:
     median frequency (in kHz)
 Q25: first
     quantile (in kHz)
 Q75: third
     quantile (in kHz)
 IQR:
     interquantile range (in kHz)
 skew:
     skewness (see note in specprop description)
 kurt:
     kurtosis (see note in specprop description)
 sp.ent:
     spectral entropy
 sfm:
     spectral flatness
 mode:
     mode frequency
 centroid:
     frequency centroid (see specprop)
 peakf:
     peak frequency (frequency with highest energy)
 meanfun:
     average of fundamental frequency measured across acoustic signal
 minfun:
     minimum fundamental frequency measured across acoustic signal
 maxfun:
     maximum fundamental frequency measured across acoustic signal
 meandom:
     average of dominant frequency measured across acoustic signal
 mindom:
     minimum of dominant frequency measured across acoustic signal
 maxdom:
     maximum of dominant frequency measured across acoustic signal
 dfrange:
     range of dominant frequency measured across acoustic signal
 modindx:
     modulation index. Calculated as the accumulated absolute difference
     between adjacent measurements of fundamental frequencies divided by the
     frequency range
 label: male or female


