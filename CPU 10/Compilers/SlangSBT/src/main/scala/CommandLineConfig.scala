import org.rogach.scallop
import org.rogach.scallop.ScallopConf
import org.rogach.scallop.exceptions.UnknownOption

/**
  * Created by Al on 24/04/2017.
  */


class CommandLineConfig(arguments: Seq[String]) extends ScallopConf(arguments) {
  version("Slang and Creole Compiler (c) 2012 Alexander Taylor")
  banner("""usage: <SlangCompiler> sourceFile [-o outputFile] [ -l [ slang | creole ] ]
           |Options:
           |""".stripMargin)
  footer("")
  val supportedLanguages = Set("slang", "creole")
  val source = trailArg[String](
    "Source file",
    descr = "Source file to compile"
  )
  val lang = opt[String](
    descr = "The language to compile. Should be a member of the following: " + supportedLanguages.mkString(", "),
    default = Some("slang"),
    validate = (x: String) => supportedLanguages.contains(x),
    short = 'l'
  )

  val destination = opt[String](
    "destination file",
    descr = "file to write the produced bytecode to. By default, this is simply the source file with a .byte extension",
    default = Some(getDefaultOutputFile(source())),
    short = 'o'
  )

  val help = opt[Boolean]("help", noshort = true, descr = "Show this message")
  private def getDefaultOutputFile(source: String): String = source.replaceAll("\\.[^.]*$", "") + ".byte"
  verify()
}