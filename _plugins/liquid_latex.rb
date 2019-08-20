require "digest"
require "fileutils"

module Jekyll
  module Tags
    class LatexBlock < Liquid::Block
      include Liquid::StandardFilters

      @@globals = {
        "debug" => false,
        "density" => "300",
        "pdflatex_cmd" => "pdflatex -interaction=nonstopmode $texfile > /dev/null 2>&1",
        "convert_cmd" => "convert -append -density $density -quality 90 $pdffile $pngfile > /dev/null 2>&1",
        "bib_cmd" => "bibtex $bibfile > /dev/null 2>&1",
        "temp_filename" => "latex_temp",
        "output_directory" => "/latex",
        "png_directory" => "/png",
        "pdf_directory" => "/pdf",
        "tex_directory" => "/tex",
        "hash_directory" => "/hash",
        "src_dir" => "",
        "dst_dir" => "",
        "disp_src" => true,
        "disp_comp" => true,
        "disp_bib" => true,
        "fold_src" => false,
        "fold_comp" => false,
        "down_tex" => true,
        "down_bib" => true,
        "down_pdf" => true,
        "emptypage" => false,
        "trim" => false,
        "optimize" => true,
      }


      @@generated_files = [ ]
      def self.generated_files
        @@generated_files
      end

      def self.latex_output_directory
        @@globals["output_directory"]
      end

      def initialize(tag_name, text, tokens)
        super
        # We now can adquire the options for this liquid tag
        @p = {}
        text.gsub("  ", " ").split(" ").each do |part|
          if part.split("=").count != 2
            raise SyntaxError.new("Syntax Error in tag 'latex'")
          end
          var,val = part.split("=")
          @p[var] = val
        end
      end

      def self.read_config(name, site)
        cfg = site.config["liquid_latex"]
        return if cfg.nil?
        value = cfg[name]
        @@globals[name] = value if !value.nil?
      end

      def self.init_globals(site)
        # Get all the variables from the config and remember them for future use.
        if !defined?(@@first_time)
          @@first_time = true
          @@globals.keys.each do |k|
            read_config(k, site)
          end
          @@globals["src_dir"] = File.join(site.config["source"], @@globals["output_directory"])
          @@globals["src_dir_png"] =File.join(@@globals["src_dir"],@@globals["png_directory"])
          @@globals["src_dir_pdf"] =File.join(@@globals["src_dir"],@@globals["pdf_directory"])
          @@globals["src_dir_tex"] =File.join(@@globals["src_dir"],@@globals["tex_directory"])
          @@globals["src_dir_hash"] =File.join(@@globals["src_dir"],@@globals["hash_directory"])

          @@globals["dst_dir"] = File.join(site.config["destination"], @@globals["output_directory"])

          # Verify and prepare the output folder if it doesn't exist
          FileUtils.mkdir_p(@@globals["src_dir"]) unless File.exists?(@@globals["src_dir"])
          FileUtils.mkdir_p(@@globals["src_dir_png"]) unless File.exists?(@@globals["src_dir_png"])
          FileUtils.mkdir_p(@@globals["src_dir_pdf"]) unless File.exists?(@@globals["src_dir_pdf"])
          FileUtils.mkdir_p(@@globals["src_dir_tex"]) unless File.exists?(@@globals["src_dir_tex"])
          FileUtils.mkdir_p(@@globals["src_dir_hash"]) unless File.exists?(@@globals["src_dir_hash"])

        end
      end

      def execute_cmd(cmd)
        cmd = cmd.gsub("\$density", @p["density"].to_s)
        cmd = cmd.gsub("convert", "convert -trim") if @p["trim"] # trim picture if enable

        cmd = cmd.gsub("\$texfile", @p["tex_fn"])
        cmd = cmd.gsub("\$pdffile", @p["pdf_fn"])
        cmd = cmd.gsub("\$bibfile", @p["bib_fn"])

        cmd = cmd.gsub("\$pngfile", @p["png_fn"])
        puts cmd if @@globals["debug"]
        system(cmd)
        return ($?.exitstatus == 0)
      end


      def render(context)
        latex_source = super
        # fix initial configurations
        site = context.registers[:site]
        #page = context.registers[:page]
        Tags::LatexBlock::init_globals(site)
        # prepare density and usepackages
        @p["density"] = @@globals["density"]

        @p["force"] = false unless @p.key?("force")

        @p["disp_src"] = @@globals["disp_src"] unless @p.key?("disp_src")
        @p["disp_comp"] = @@globals["disp_comp"] unless @p.key?("disp_comp")
        @p["disp_bib"] = @@globals["disp_bib"] unless @p.key?("disp_bib")

        @p["fold_src"] = @@globals["fold_src"] unless @p.key?("fold_src")
        @p["fold_comp"] = @@globals["fold_comp"] unless @p.key?("fold_comp")

        @p["down_tex"] = @@globals["down_tex"] unless @p.key?("down_tex")
        @p["down_bib"] = @@globals["down_bib"] unless @p.key?("down_bib")
        @p["down_pdf"] = @@globals["down_pdf"] unless @p.key?("down_pdf")

        @p["optimize"] = @@globals["optimize"] unless @p.key?("optimize")
        #Convert string to bool
        @p["disp_src"] = @p["disp_src"].to_s == "true"
        @p["disp_bib"] = @p["disp_bib"].to_s == "true"
        @p["disp_comp"] = @p["disp_comp"].to_s == "true"

        @p["fold_src"] = @p["fold_src"].to_s == "true"
        @p["fold_comp"] = @p["fold_comp"].to_s == "true"
        @p["down_tex"] = @p["down_tex"].to_s == "true"
        @p["down_pdf"] = @p["down_pdf"].to_s == "true"
        @p["down_bib"] = @p["down_bib"].to_s == "true"
        @p["optimize"] = @p["optimize"].to_s == "true"

        if @p["optimize"]
          @p["trim"] = true
          @p["emptypage"] = true
        else
          @p["trim"] =  @@globals["trim"] unless @p.key?("trim")
          @p["emptypage"] =  @@globals["emptypage"] unless @p.key?("emptypage")
        end


        @p["fold_comp"] = true if @p["fold_src"] # we fold compilation if src is fold (better display)



        src_disp=latex_source
        # Source (insert in another file) managment
        if @p.key?("source")
          external_source=true
          source_file =File.join(@@globals["src_dir_tex"],@p["source"])
          source_tex = File.readlines(source_file).join
          add_txt="%<-----> ADDED to "+@p["source"]+" <----->\n"
          latex_source=source_tex.gsub("\\end{document}\n",add_txt + latex_source+"\\end{document}\n")
          src_disp=add_txt+src_disp
        else
          external_source=false
          source_file = ""

        end
        # Bitex managment
        regexbib=/(<bib>)(.*?)(<\/bib>)/m
        source_bib = latex_source.slice!(regexbib).to_s.slice!(regexbib,2).to_s
        bibuse=false
        unless source_bib.empty?
          bibuse=true
        end
        #Calculate the hash of the actual box
        hash_p = Digest::MD5.hexdigest(@p.to_s+latex_source+source_bib)

        if @p.key?("filename")
          filename = @p["filename"]
        else
          filename = "latex-" + hash_p
        end
        filename_png=filename + ".png"
        filename_pdf=filename + ".pdf"
        filename_tex=filename + ".tex"
        filename_bib=filename + ".bib"
        filename_hash=filename + ".hash"


        @p["hash_fn"] = File.join(@@globals["src_dir_hash"],filename_hash)
        @p["png_fn"] = File.join(@@globals["src_dir_png"],filename_png)
        @p["save_pdf_fn"] = File.join(@@globals["src_dir_pdf"],filename_pdf)
        @p["save_tex_fn"] = File.join(@@globals["src_dir_tex"],filename_tex)
        @p["save_bib_fn"] = File.join(@@globals["src_dir_tex"],filename_bib) #the bib file will be in the tex folder
        # if this LaTeX code is already compiled, skip its compilation

        needwork=true
        if File.exists?(@p["hash_fn"])
          hash_file = File.open(@p["hash_fn"],"r").first.delete(" \t\r\n")
          needwork = false if hash_file == hash_p #we dont compile if p is the same
          puts "No change on " + filename + " Skipping compilation" if hash_file == hash_p
        end

        ok = true
        if needwork or @p["force"]
          puts "Compiling " + filename + " ..."
          #create hash File
          hash_file = File.new(@p["hash_fn"], "w")
          hash_file.puts(hash_p)
          hash_file.close

          @p["tex_fn"] = @@globals["temp_filename"] + ".tex"
          @p["pdf_fn"] = @@globals["temp_filename"] + ".pdf"
          @p["bib_fn"] = @@globals["temp_filename"]
          if bibuse
            file = File.new(@p["bib_fn"]+ ".bib", "w")
            file.puts(source_bib)
            file.close
          end

          if @p["disp_comp"]
            tex_compile=latex_source
            tex_compile = tex_compile.gsub("\\begin{document}","\\begin{document}\n\\pagestyle{empty}\n") if @p["emptypage"] #add emptypage if enable
            tex_compile = tex_compile.gsub("\\bibliography{"+filename+"}","\\bibliography{"+@@globals["temp_filename"]+"}") if bibuse # replace the filename by temp name for bibtex

            file = File.new(@p["tex_fn"], "w")
            file.puts(tex_compile)
            file.close
            # Compile the document to PNG

            ok = execute_cmd(@@globals["pdflatex_cmd"])
            ok = execute_cmd(@@globals["pdflatex_cmd"])
            if bibuse
              ok = execute_cmd(@@globals["bib_cmd"])
              ok = execute_cmd(@@globals["pdflatex_cmd"])
              ok = execute_cmd(@@globals["pdflatex_cmd"])
            end
            execute_cmd(@@globals["convert_cmd"]) if ok
          end

          #Save tex file
          if @p["down_tex"]
            file = File.new(@p["save_tex_fn"], "w")
            file.puts(latex_source)
            file.close
          end

          #Save bib file
          if @p["down_bib"] and bibuse
            file = File.new(@p["save_bib_fn"], "w")
            file.puts(source_bib)
            file.close
          end

          #Save pdf File
          if ok and @p["down_pdf"]
            tex_compile=latex_source
            tex_compile = tex_compile.gsub("\\bibliography{"+filename+"}","\\bibliography{"+@@globals["temp_filename"]+"}") if bibuse # replace the filename by temp name for bibtex

            file = File.new(@p["tex_fn"], "w")
            file.puts(tex_compile)
            file.close
            ok = execute_cmd(@@globals["pdflatex_cmd"])
            ok = execute_cmd(@@globals["pdflatex_cmd"])
            if bibuse
              ok = execute_cmd(@@globals["bib_cmd"])
              ok = execute_cmd(@@globals["pdflatex_cmd"])
              ok = execute_cmd(@@globals["pdflatex_cmd"])
            end
            FileUtils.cp(@p["pdf_fn"],@p["save_pdf_fn"]) if ok
          end

          # Delete temporary files
          if ok
            Dir.glob(@@globals["temp_filename"] + ".*").each do |f|
              File.delete(f)
            end
          end
        end

        if ok
          # Add the PNG file to the list of static files for the final copy once generated
          hash_dir=File.join(@@globals["output_directory"],@@globals["hash_directory"])

          png_dir=File.join(@@globals["output_directory"],@@globals["png_directory"])
          pdf_dir=File.join(@@globals["output_directory"],@@globals["pdf_directory"])
          tex_dir=File.join(@@globals["output_directory"],@@globals["tex_directory"])

          st_file = Jekyll::StaticFile.new(site, site.source, hash_dir, filename_hash)
          @@generated_files << st_file
          site.static_files << st_file

          if @p["disp_comp"]
            st_file = Jekyll::StaticFile.new(site, site.source, png_dir, filename_png)
            @@generated_files << st_file
            site.static_files << st_file
          end

          # Same for the tex and pdf
          #Save tex File
          if @p["down_tex"]
            st_file = Jekyll::StaticFile.new(site, site.source, tex_dir, filename_tex)
            @@generated_files << st_file
            site.static_files << st_file
          end
          # Save bib
          if bibuse and @p["down_bib"]
            st_file = Jekyll::StaticFile.new(site, site.source, tex_dir, filename_bib)
            @@generated_files << st_file
            site.static_files << st_file
          end

          #Save pdf
          if @p["down_pdf"]
            st_file = Jekyll::StaticFile.new(site, site.source, pdf_dir, filename_pdf)
            @@generated_files << st_file
            site.static_files << st_file
          end


          # Build the html
          png_path = File.join("..",png_dir, filename_png)
          pdf_path = File.join("..",pdf_dir, filename_pdf)
          tex_path = File.join("..",tex_dir, filename_tex)
          bib_path = File.join("..",tex_dir, filename_bib)

          #SOURCE DISPLAY
          resp=""
          resp << "<div class=\"challenge\" markdown=\"1\"> \n"
          resp << "<h2>" + filename + "</h2>\n"

          if @p["disp_src"] or @p["down_tex"]
            resp << "<div class=\"latex-src"
            resp << " latex-foldable" if @p["fold_src"]
            resp << "\" markdown=\"1\"> \n"

            resp << "<h2> Tex file : "
            resp << "<a href=\""+tex_path + "\" >" if @p["down_tex"]
            resp << filename_tex
            resp << "</a>" if @p["down_tex"]
            resp << "<span class='fold-unfold glyphicon glyphicon-collapse-down'></span>" if @p["fold_src"]

            resp << "</h2>  "
            if @p["disp_src"]
              resp << "<div class=\"latex-hide\" markdown=\"1\">\n" if @p["fold_src"]

              resp << "~~~\n"
              resp << src_disp
              resp << "\n~~~\n{: .language-latex}\n"

              resp << "</div>\n" if @p["fold_src"]
            end
            resp << "\n</div>\n"

          end
          #BIBTEX DISPLAY
          if (@p["disp_bib"] or @p["down_bib"]) and bibuse
            resp << "<div class=\"latex-src"
            resp << " latex-foldable" if @p["fold_src"]
            resp << "\" markdown=\"1\"> \n"

            resp << "<h2> Bib file : "
            resp << "<a href=\""+bib_path + "\" >" if @p["down_bib"]
            resp << filename_bib
            resp << "</a>" if @p["down_bib"]
            resp << "<span class='fold-unfold glyphicon glyphicon-collapse-down'></span>" if @p["fold_src"]

            resp << "</h2>\n"
            if @p["disp_bib"]
              resp << "<div class=\"latex-hide\" markdown=\"1\">\n" if @p["fold_src"]

              resp << "~~~\n"
              resp << source_bib
              resp << "\n~~~\n{: .language-latex}\n"

              resp << "</div>\n" if @p["fold_src"]
            end
            resp << "\n</div>\n"
          end

          #COMPILATION DISPLAY
          if @p["down_pdf"] or @p["disp_comp"]
            resp << "<div class=\"latex-compil"
            resp << " latex-foldable"if @p["fold_comp"]
            resp << "\" markdown=\"1\"> \n"
            resp << "<h2> Compilation : "
            resp << "<a href=\""+pdf_path + "\" >" if @p["down_pdf"]
            resp << filename_pdf if @p["down_pdf"]
            resp << "</a>" if @p["down_pdf"]
            resp << "<span class='fold-unfold glyphicon glyphicon-collapse-down'></span>" if @p["fold_comp"]

            resp << "</h2>\n"
            resp << "<div class=\"latex-hide\" markdown=\"1\">\n" if @p["fold_comp"]
            resp << "<img src=\"" + png_path + "\" /> " if @p["disp_comp"]

            resp << "\n</div>\n" if @p["fold_comp"]

            resp << "\n</div>\n"

          end
          resp << "\n</div>\n"
        else
          # Generate a block of text in the post with the original source
          raise SyntaxError.new("Error compiling latex'")
          resp = "Failed to render the following block of LaTeX:<br/>\n"
          resp << "<pre><code>" + latex_tex + "</code></pre>"


        end

        return resp
      end
    end

  end

  class Site
    # Alias for the parent Site::write method (ingenious static override)
    alias :super_latex_write :write

    def write
      super_latex_write   # call the super method
      Tags::LatexBlock::init_globals(self)
      dest_folder = File.join(dest, Tags::LatexBlock::latex_output_directory)
      FileUtils.mkdir_p(dest_folder) unless File.exists?(dest_folder)
      # clean all previously rendered files not rendered in the actual build
      src_files = []
      Tags::LatexBlock::generated_files.each do |f|
        src_files << f.path
      end
      pre_files = Dir.glob(File.join(source, Tags::LatexBlock::latex_output_directory, "**/*")).reject {|fn| File.directory?(fn) }
      to_remove = pre_files - src_files
       to_remove.each do |f|
         File.delete f if File.exists?(f)
         d, fn = File.split(f)
         d=File.split(d)
         df = File.join(dest, Tags::LatexBlock::latex_output_directory,d.last ,fn)
         File.delete df if File.exists?(df)
       end
    end
  end
 end

Liquid::Template.register_tag('latex', Jekyll::Tags::LatexBlock)
