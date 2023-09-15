# Obtaining protein family members [![license](https://img.shields.io/github/license/pegi3s/seda-pipeline-protein-family-members?style=flat-square)](https://github.com/pegi3s/seda-pipeline-protein-family-members) [![dockerhub](https://img.shields.io/badge/Docker%20Hub-7289da.svg?style=flat-square)](https://hub.docker.com/r/pegi3s/seda-pipeline-protein-family-members) [![github](https://img.shields.io/badge/GitHub-7289da.svg?style=flat-square)](https://github.com/pegi3s/seda-pipeline-protein-family-members)

A [SEDA](https://www.sing-group.org/seda/) pipeline created in [Compi](https://www.sing-group.org/compi/) that implements the ["Obtaining protein family members"](https://www.sing-group.org/seda/manual/protocols.html#obtaining-protein-family-members) SEDA-based protocol. Created using the [SEDA-Compi pipelines framework](https://github.com/sing-group/seda-compi-pipelines).

This protocol shows how to retrieve all members of a given protein family such as, for instance, mucins. The main feature of mucin proteins is their extended region of tandemly repeated sequences (PTS repeats), which contain prolines (P) together with serines (S), and/or threonines (T), which generally occupy between 30% and 90% of the protein length, and that cannot be detected in homology searches due to their poor sequence conservation (https://doi.org/10.1371/journal.pone.0003041). Mucins also show signal peptides and other associated domains.

# Quick-start: running the pipeline with sample data

Download [this ZIP](https://static.sing-group.org/software/pegi3s/seda-pipeline-protein-family-members/sample-working-dir.zip) and decompress it. The path where it is extracted will be referred as "working directory" (`/path/to/working_dir`).

Move to the working directory and edit the `params/pfamscan.sedaParams` file to set your e-mail address in the third line (`eMail`), otherwise PfamScan will not run. Then, simply run `./run.sh "$(pwd)"` to execute the entire pipeline with two input files.

The two input FASTA files for Homo sapiens (https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.39) and Drosophila melanogaster (https://www.ncbi.nlm.nih.gov/assembly/GCF_000001215.4) were downloaded from the NCBI assembly RefSeq database by selecting the Download assembly / Protein FASTA (.faa) option.

To run specific tasks an additional parameter can be passed to the `run.sh` script: `./run.sh "$(pwd)" "--single-task extract-headers"` or `./run.sh "$(pwd)" "--until pfamscan"`.

# Applying the protocol to other case studies

Applying the protocol to other case studies is easy, you only need to:

1. Put the protein FASTA files at `input/pattern-filtering/`.
2. Edit the `params/pattern-filtering.sedaParams` to set an appropriate pattern filtering parameters to your case study. This file can be created and exported using the SEDA GUI, which is handy for advanced pattern filtering cases.

# Contributors

<a href="https://github.com/pegi3s/seda-pipeline-protein-family-members/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=pegi3s/seda-pipeline-protein-family-members" />
</a>

<sup>Made with [contrib.rocks](https://contrib.rocks).</sup>
