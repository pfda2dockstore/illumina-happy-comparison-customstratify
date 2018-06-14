baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: illumina-happy-comparison-customstratify
inputs:
  adjust_conf_regions:
    default: false
    doc: Correct the confident regions for insertion padding (base before and after)
    inputBinding:
      position: 11
      prefix: --adjust_conf_regions
    type: boolean
  comparison_method:
    default: vcfeval-no-partialcredit
    doc: The comparison method to use
    inputBinding:
      position: 9
      prefix: --comparison_method
    type: string
  distance_threshold:
    default: 30
    doc: For distance-based matching, how far do variants need to be apart
    inputBinding:
      position: 10
      prefix: --distance_threshold
    type: long
  query_2_method:
    default: Method 2
    doc: A label for the second query (e.g. the name of the variant calling method)
    inputBinding:
      position: 6
      prefix: --query_2_method
    type: string
  query_2_vcf:
    doc: (optional) a second query file, useful when benchmarking comparisons
    inputBinding:
      position: 7
      prefix: --query_2_vcf
    type: File?
  query_method:
    default: Method 1
    doc: A label for the query (e.g. the name of the variant calling method)
    inputBinding:
      position: 4
      prefix: --query_method
    type: string
  query_vcf:
    doc: The VCF file to benchmark
    inputBinding:
      position: 5
      prefix: --query_vcf
    type: File
  reference:
    default: hs37d5
    doc: The reference sequence to use. This must match the reference used for your
      truth and query VCFs.
    inputBinding:
      position: 3
      prefix: --reference
    type: string
  sample_gender:
    default: female
    doc: The sample gender determines how calls on chrX are handled. Automatic detection
      will check if all truth calls on chrX are haploid in order to tell if a sample
      is male.
    inputBinding:
      position: 12
      prefix: --sample_gender
    type: string
  stratification_tarfile:
    doc: Stratification tar.gz file with bed files and a tsv specifying which bed
      files to use
    inputBinding:
      position: 13
      prefix: --stratification_tarfile
    type: File?
  target_bed:
    doc: (optional) target regions covered by the query VCF file
    inputBinding:
      position: 8
      prefix: --target_bed
    type: File?
  truth_bed:
    doc: These are the confident regions for the truthset.
    inputBinding:
      position: 2
      prefix: --truth_bed
    type: File?
  truth_vcf:
    doc: This is the truthset file, for example a Platinum Genomes or Genome in a
      Bottle VCF.
    inputBinding:
      position: 1
      prefix: --truth_vcf
    type: File
label: GA4GH Benchmarking Custom Stratify
outputs:
  detailed_results:
    doc: This archive contains the full hap.py outputs, including an annotated VCF
      file and full ROC data
    outputBinding:
      glob: detailed_results/*
    type: File
  happy_log:
    doc: Hap.py logfile
    outputBinding:
      glob: happy_log/*
    type: File
  report_html:
    doc: A summary report with the comparison results
    outputBinding:
      glob: report_html/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/illumina-happy-comparison-customstratify:6
s:author:
  class: s:Person
  s:name: Justin Zook
