package vote

import grails.transaction.Transactional

@Transactional
class TagService {

    def static strToTagList(String tagstr) {
        ArrayList<Tag> taglist = new ArrayList<>()
        if (tagstr != null && tagstr != "") {
            def tag = tagstr.split(" ")
            def tempTag
            tag.each {
                tempTag = Tag.findByName(it)
                if (tempTag) {
                    taglist.add(tempTag)
                } else {
                    tempTag = new Tag(name: it)
                    if (tempTag?.validate()) {
                        tempTag.save()
                        log.info("Tag" + it + "Saved Successfully")
                        taglist.add(tempTag)
                    } else {
                        tempTag.discard()
                        log.error("Tag" + it + " saved failed")
                        flash.error = "Tag" + it + " saved failed"
                    }
                }
            }
        }
        return taglist
    }
}
