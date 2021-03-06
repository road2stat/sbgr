% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/04-files.R
\name{file_meta_update}
\alias{file_meta_update}
\title{Update project's file metadata}
\usage{
file_meta_update(
  auth_token = NULL,
  project_id = NULL,
  file_id = NULL,
  name = NULL,
  file_type = c("text", "binary", "fasta", "csfasta", "fastq", "qual", "xsq", "sff",
    "bam", "bam_index", "illumina_export", "vcf", "sam", "bed", "archive", "juncs",
    "gtf", "gff", "enlis_genome"),
  qual_scale = c("sanger", "illumina13", "illumina15", "illumina18", "solexa"),
  seq_tech = c("454", "Helicos", "Illumina", "Solid", "IonTorrent"),
  sample = NULL,
  library = NULL,
  platform_unit = NULL,
  paired_end = NULL,
  ...
)
}
\arguments{
\item{auth_token}{auth token}

\item{project_id}{ID of a project you want to access.}

\item{file_id}{ID of a file you want to access.}

\item{name}{File name.}

\item{file_type}{File type. This metadata parameter is mandatory
for each file.}

\item{qual_scale}{Quality scale encoding. For FASTQ files, you must
either specify the quality score encoding sch which contains the
FASTQ quality scale detector wrapper. In that case, you can
specify the quality score encoding scheme by setting
\code{qual_scale} inside the pipeline. For BAM files, this value
should always be \code{'sanger'}.}

\item{seq_tech}{Sequencing technology. The \code{seq_tech} parameter
allows you to specify the sequencing technology used. This metadata
parameter is only required by some the tools and pipelines;
however, it is strongly recommended that you set it whenever possible,
unless you are certain that your pipeline will work without it.}

\item{sample}{Sample ID. You can use the \code{sample} parameter to specify
the sample identifier. The value supplied in this field will be written
to the read group tag (\code{@RG:SM}) in SAM/BAM files generated from reads
with the specified Sample ID. AddOrReplaceReadGroups will use this
parameter as the value for the read group tag in a SAM/BAM file.}

\item{library}{Library. You can set the library for the read using the
\code{library} parameter. The value supplied in this field will be written
to the read group tag (\code{@RG:LB}) in SAM/BAM files generated from
reads with the specified Library ID. AddOrReplaceReadGroups will use
this parameter as the value for the read group tag in a SAM/BAM file.}

\item{platform_unit}{Platform unit. You can set the platform unit
(e.g. lane for Illumina, or slide for SOLiD) using the \code{platform_unit}
parameter. The value supplied in this field will be written to the read
group tag (\code{@RG:PU}) in SAM/BAM files generated from the reads with
the specified Platform Unit. AddOrReplaceReadGroups will use this parameter
as the value for the read group tag of a SAM/BAM file.}

\item{paired_end}{Paired end. With paired-end reads, this parameter
indicates if the read file is left end (1) or right end (2).
For SOLiD CSFASTA files, paired end files 1 and 2 correspond to R3
and F3 files, respectively.}

\item{...}{parameters passed to sbgapi function}
}
\value{
parsed list of the returned json
}
\description{
This function updates project's file metadata. You can also use this call
to change filenames if you supply the \code{name} argument.
}
\details{
For more information about file metadata, please check the
File Metadata Documentation:
\url{https://developer.sbgenomics.com/platform/metadata}.
}
\examples{
token = '420b4672ebfc43bab48dc0d18a32fb6f'
\donttest{req = file_meta_update(token,
            project_id = '1c1d06d2-5862-48f6-b595-e0099b20937e',
            file_id = '530854e2e4b036506b803c7e',
            name = 'c.elegans_chr2_test.fastq',
            file_type = 'fastq', qual_scale = 'illumina13',
            seq_tech = 'Illumina')}
}
